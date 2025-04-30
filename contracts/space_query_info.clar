;; Define the data variables with empty maps
(define-map spaces (buff 32) {space_name: (string-utf8 20), location: (string-utf8 20), is_premium: bool, asset_id: uint, stx_balance: int})
(define-map users principal {name: (string-utf8 20), location: (string-utf8 20), active_points: int, stx_balance: int})

(define-public (get-all-spaces)
  ;; For simplicity, return an empty list
  (ok (list))
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

(define-public (get-all-users)
  ;; For simplicity, return an empty list
  (ok (list))
)

(define-public (get-user-info (user-id principal))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (ok (unwrap-panic user))
    )
  )
)
