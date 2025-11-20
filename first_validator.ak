use aiken/collection/list
use cardano/transaction.{OutputReference, Transaction}

// ============================================================================
// DATUM
// ============================================================================
pub type LoyaltyDatum {
  customer: ByteArray,
  merchant: ByteArray,
  token_amount: Int,
  redeemed: Bool,
}

// ============================================================================
// REDEEMER
// ============================================================================
pub type LoyaltyRedeemer {
  Redeem
  Revoke
}

// ============================================================================
// VALIDATOR
// ============================================================================
validator loyalty {
  spend(
    datum_opt: Option<LoyaltyDatum>,
    redeemer: LoyaltyRedeemer,
    _input: OutputReference,
    tx: Transaction,
  ) {
    expect Some(datum) = datum_opt
    let signatories = tx.extra_signatories

    when redeemer is {
      Redeem -> {
        expect list.has(signatories, datum.customer)
        True
      }

      Revoke -> {
        expect list.has(signatories, datum.merchant)
        True
      }
    }
  }

  else(_) {
    fail
  }
}
