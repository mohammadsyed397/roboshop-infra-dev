variable "components" {
    default = {
        user = {
            rule_priority = 20
        }
        cart = {
            rule_priority = 30
        }
        shipping = {
            rule_priority = 40
        }
        frontend = {
            rule_priority = 10
        }
    }
}