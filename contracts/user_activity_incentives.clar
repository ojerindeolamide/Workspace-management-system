;; Define the data variables with empty maps
(define-map users principal {name: (string-utf8 20), location: (string-utf8 20), active_points: int, stx_balance: int})

(define-public (earn-stx (user-id principal) (points int))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: (get location (unwrap-panic user)), active_points: (get active_points (unwrap-panic user)), stx_balance: (+ (get stx_balance (unwrap-panic user)) (* points 10))})
        (ok "STX earned successfully")
      )
    )
  )
)

(define-public (increase-user-active-points (user-id principal) (points int))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: (get location (unwrap-panic user)), active_points: (+ (get active_points (unwrap-panic user)) points), stx_balance: (get stx_balance (unwrap-panic user))})
        (ok "User active points increased")
      )
    )
  )
)

(define-public (decrease-user-active-points (user-id principal) (points int))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: (get location (unwrap-panic user)), active_points: (- (get active_points (unwrap-panic user)) points), stx_balance: (get stx_balance (unwrap-panic user))})
        (ok "User active points decreased")
      )
    )
  )
)

(define-public (get-user-stx-balance (user-id principal))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (ok (get stx_balance (unwrap-panic user)))
    )
  )
)
