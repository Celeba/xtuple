[
  {
    "context": "sales",
    "nameSpace": "XM",
    "type": "Characteristic",
    "table": "char",
    "isExtension": true,
    "comment": "Extended by Sales",
    "relations": [
      {
        "column": "char_id",
        "inverse": "id"
      }
    ],
    "properties": [
      {
        "name": "isSalesOrders",
        "attr": {
          "type": "Broolean",
          "column": "char_salesorders"
        }
      }
    ],
    "sequence": 0,
    "isSystem": true
  }
]
