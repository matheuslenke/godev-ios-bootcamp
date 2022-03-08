import UIKit

var dict: [[String: Any]] = [["name": "Lenke",
                              "email": "matheuslenke@icloud.com",
                              "age": 23, "isActive": true],
                             ["name": "Matheus",
                              "email": "matheuslenke@gmail.com",
                              "age": 23, "isActive": false
                             ]]

print(dict[0]["name"] ?? "default")

print(dict[0]["afksofao"] ?? "default")

print(dict[1]["age"]!) // Force Unwrap! Dangerous

print(dict[1].keys)
print(dict[1].values)

dict[1].mapValues { item in
    print(item)
}
