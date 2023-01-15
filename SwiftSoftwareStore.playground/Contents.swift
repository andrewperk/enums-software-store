// The Products
enum ProductType: String, CaseIterable {
    case aceRepository = "Ace Repository"
    case dealForcer = "Deal Forcer"
    case kadencePlanner = "Kadence Planner"
    case mailCannon = "Mail Cannon"
}

// The Edition
enum Edition: String {
    case basic = "Basic"
    case premium = "Premium"
    case ultimate = "Ultimate"

    mutating func upgrade() {
        switch self {
            case .basic:
            self = .premium
            case .premium:
            self = .ultimate
            case .ultimate:
            print("Can't upgrade further")
        }
    }
}

// Delivery Methods
enum DeliveryMethod {
    case cloudDigital(isLifetime: Bool)
    case shipping(weight: Int)

    var shippingCost: Int {
        switch self {
            case .cloudDigital:
                return 0
            case let .shipping(weight):
                return (weight * 2)
        }
    }
}

// See the products
func displayProductOfferings() {
    // Display number of products
    print("There are \(ProductType.allCases.count) products: ")
    // Iterate over the cases and print rawValue
    for product in ProductType.allCases {
        print(product.rawValue)
    }
}

// Send order conf.
func sendOrderConfirmation(of productType: ProductType, in edition: Edition, by deliveryMethod: DeliveryMethod) {
    // Print purchase message
    print("Thank you for purchasing the \(edition.rawValue) edition of \(productType.rawValue)")

    // Loop over delivery methods
    switch deliveryMethod {
        case .shipping:
            print("Your order will be shipped to you at a cost of $\(deliveryMethod.shippingCost)")
        case let .cloudDigital(isLifeTime):
            if isLifeTime {
                print("You have lifetime cloud access")
            } else {
                print("You can access your subscription information on the cloud")
            }
    }
}

// See all products
displayProductOfferings()

var myEdition = Edition.basic
myEdition.upgrade()
sendOrderConfirmation(of: ProductType.aceRepository, in: myEdition, by: DeliveryMethod.shipping(weight: 1))
