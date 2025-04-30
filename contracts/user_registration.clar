;; Define the data variables with empty maps
(define-map users principal {name: (string-utf8 20), location: (string-utf8 20), active_points: int, stx_balance: int})

(define-public (add-user (user-name (string-utf8 20)) (user-location (string-utf8 20)))
  (let (
        (user-id tx-sender)
      )
    (map-set users user-id {name: user-name, location: user-location, active_points: 0, stx_balance: 0})
    (ok "User registered successfully")
  )
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

(define-public (get-user-active-points (user-id principal))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (ok (get active_points (unwrap-panic user)))
    )
  )
)

(define-public (update-user-location (user-id principal) (new-location (string-utf8 20)))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: new-location, active_points: (get active_points (unwrap-panic user)), stx_balance: (get stx_balance (unwrap-panic user))})
        (ok "User location updated")
      )
    )
  )
)

(define-public (get-all-users)
  ;; For simplicity, return an empty list
  (ok (list))
)
