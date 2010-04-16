-- Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
-- $Id$
--
-- Constraints & Indexes for PokeBop Models
--
-- * This file is sorted alphabetically by table
-- * The only "NOT NULL" values are for things which are optional.
--   There should be very few optional things.  For example, there
--   is no such thing as an optional enum value.  0 should be used
--   for the UNKNOWN enum value.
-- * Booleans are: <name> NUMBER(1) CHECK (<name> BETWEEN 0 AND 1) NOT NULL,
-- * How to number all constraints sequentially:
--   perl -pi -e 's/(\w+_t)\d+/$1.++$n{$1}/e' bOP-constraints.sql
--   Make sure there is a table_tN ON each constraint--random N.
--
----------------------------------------------------------------

----------------------------------------------------------------
-- Non-PRIMARY KEY Constraints
----------------------------------------------------------------

--
-- card_game_t
--
ALTER TABLE card_game_t
  ADD CONSTRAINT card_game_t2
  FOREIGN KEY (owner_realm_id)
  REFERENCES realm_owner_t(realm_id)
/
CREATE INDEX card_game_t3 ON card_game_t (
  owner_realm_id
)
/

--
-- hand_card_t
--
ALTER TABLE hand_card_t
  ADD CONSTRAINT hand_card_t2
  FOREIGN KEY (card_game_id)
  REFERENCES card_game_t(card_game_id)
/
CREATE INDEX hand_card_t3 ON hand_card_t (
  card_game_id
)
/
ALTER TABLE hand_card_t
  ADD CONSTRAINT hand_card_t4
  FOREIGN KEY (user_id)
  REFERENCES user_t(user_id)
/
CREATE INDEX hand_card_t5 ON hand_card_t (
  user_id
)
/
ALTER TABLE hand_card_t
  ADD CONSTRAINT hand_card_t6
  CHECK (hand_index > 0)
/
ALTER TABLE hand_card_t
  ADD CONSTRAINT hand_card_t7
  CHECK (suit_rank > 0)
/
ALTER TABLE hand_card_t
  ADD CONSTRAINT hand_card_t8
  CHECK (hand_index BETWEEN 0 AND 1)
/
