;; Define the data variables with empty maps
(define-map spaces (buff 32) {space_name: (string-utf8 20), location: (string-utf8 20), is_premium: bool, asset_id: uint, stx_balance: int})

(define-public (register-space (space_name (string-utf8 20)) (location (string-utf8 20)) (is_premium bool) (stx_balance int))
  (let (
        (owner tx-sender)
        (space-id (hash-space space_name location))
      )
    (map-set spaces space-id {space_name: space_name, location: location, is_premium: is_premium, asset_id: u0, stx_balance: stx_balance})
    (ok {space_id: space-id, message: "Space registered successfully"})
  )
)

(define-private (hash-space (space-name (string-utf8 20)) (location (string-utf8 20)))
  ;; For simplicity, just return a fixed buffer
  0x0000000000000000000000000000000000000000000000000000000000000000
)

(define-public (get-space-info (space-id (buff 32)))
  (let (
        (space (map-get? spaces space-id))
      )
    (if (is-none space)
      (err "Space not found")
      (ok (unwrap-panic space))
    )
  )
)

(define-public (get-all-spaces)
  ;; For simplicity, return an empty list
  (ok (list))
)

(define-public (get-owner-of-space (space-id (buff 32)))
  (let (
        (space (map-get? spaces space-id))
      )
    (if (is-none space)
      (err "Space not found")
      (ok (get asset_id (unwrap-panic space)))
    )
  )
)
