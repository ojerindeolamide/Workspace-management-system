;; Define the data variables with empty maps
(define-map spaces (buff 32) {space_name: (string-utf8 20), location: (string-utf8 20), is_premium: bool, asset_id: uint, stx_balance: int})
(define-map users principal {name: (string-utf8 20), location: (string-utf8 20), active_points: int, stx_balance: int})

(define-private (hash-space (space-name (string-utf8 20)) (location (string-utf8 20)))
  ;; For simplicity, just return a fixed buffer
  0x0000000000000000000000000000000000000000000000000000000000000000
)

(define-public (increase-stx (user-id principal) (amount int))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: (get location (unwrap-panic user)), active_points: (get active_points (unwrap-panic user)), stx_balance: (+ (get stx_balance (unwrap-panic user)) amount)})
        (ok "STX balance increased")
      )
    )
  )
)

(define-public (decrease-stx (user-id principal) (amount int))
  (let (
        (user (map-get? users user-id))
      )
    (if (is-none user)
      (err "User not found")
      (begin
        (map-set users user-id {name: (get name (unwrap-panic user)), location: (get location (unwrap-panic user)), active_points: (get active_points (unwrap-panic user)), stx_balance: (- (get stx_balance (unwrap-panic user)) amount)})
        (ok "STX balance decreased")
      )
    )
  )
)
