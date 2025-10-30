import SwiftUI

//Recipe Models
struct RecipeItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let type: FoodType
    let ingredients: [String]
    let steps: [RecipeStep]
}

struct RecipeStep: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String?
}

struct FoodRecipe: View {

    private let recipes: [RecipeItem] = [
        RecipeItem(
            title: "Mango Smoothie",
            imageName: "mangoSmoothie",
            type: .fresh,
            ingredients: [
                "1 ripe mango",
                "1/2 cup yogurt",
                "1/2 cup milk",
                "Mint or chia seeds (a pinch)"
            ],
            steps: [
                RecipeStep(title: "Prep", description: "Peel and dice 1 ripe mango. Chill the cubes for 10 minutes.", imageName: "msPrep"),
                RecipeStep(title: "Blend", description: "Blend mango, yogurt, milk, and ice until smooth.", imageName: "msBlend"),
                RecipeStep(title: "Serve", description: "Pour into a glass and top with mint or chia seeds.", imageName: "msServe")
            ]
        ),
        RecipeItem(
            title: "Watermelon Popsicle",
            imageName: "watermelonPopsicle",
            type: .fresh,
            ingredients: [
                "3 cups seedless watermelon, cubed",
                "1 tbsp lime juice",
                "1–2 tsp honey (optional)"
            ],
            steps: [
                RecipeStep(title: "Prep", description: "Cube seedless watermelon and remove any seeds.", imageName: "wpPrep"),
                RecipeStep(title: "Blend", description: "Blend with a squeeze of lime and a touch of honey.", imageName: "wpBlend"),
                RecipeStep(title: "Freeze", description: "Pour into molds and freeze for 4–6 hours.", imageName: "wpFreeze")
            ]
        )
    ]

    private let columns = [ GridItem(.adaptive(minimum: 180), spacing: 18) ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text("Featured")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)

                    LazyVGrid(columns: columns, spacing: 18) { //only displays when needed
                        ForEach(recipes) { recipe in
                            NavigationLink {
                                RecipeDetailView(recipe: recipe)
                            } label: {
                                RecipeCard(recipe: recipe)
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
                    .frame(maxWidth: 900)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color("beige"))
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color("beige"), for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
        }
    }
}

//Recipe Detail
private struct RecipeDetailView: View {
    let recipe: RecipeItem
    private let headerHeight: CGFloat = 150

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 80)
                    .frame(maxWidth: .infinity)
                    .clipped()

                LinearGradient(
                    colors: [Color.black.opacity(0.0), Color.black.opacity(0.35)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: headerHeight * 0.55)

                VStack(alignment: .leading, spacing: 6) {
                    Text(recipe.title)
                        .font(.title3.bold())
                        .foregroundColor(.white)

                    Text(recipe.type.rawValue)
                        .font(.caption.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.18))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }

            Divider().overlay(Color.black.opacity(0.06))

            TabView {
                IntroStepView(recipe: recipe)
                    .padding(.top, 8)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: 700)

                ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                    StepPageView(step: step, stepIndex: index + 1, totalSteps: recipe.steps.count)
                        .padding(.top, 8)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: 700)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .background(Color("beige"))
        }
        .navigationTitle(recipe.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("beige"))
    }
}

#Preview {
    FoodRecipe()
}
