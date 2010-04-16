-- Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
-- $Id$
--
-- Data Definition Language for PokeBop Models
--
-- * Tables are named after their models, but have underscores where
--   the case changes.  
-- * Make sure the type sizes match the Model field types--yes, this file 
--   should be generated from the Models...
-- * Don't put any constraints or indices here.  Put them in *-constraints.sql.
--   It makes it much easier to manage the constraints and indices this way.
--

CREATE TABLE card_game_t (
  card_game_id NUMERIC(18),
  owner_realm_id NUMERIC(18) NOT NULL,
  CONSTRAINT card_game_t1 PRIMARY KEY(card_game_id)
)
/

CREATE TABLE hand_card_t (
  card_game_id NUMERIC(18),
  user_id NUMERIC(18),
  hand_index NUMERIC(1) NOT NULL,
  suit_rank NUMERIC(2) NOT NULL,
  is_turned_up NUMERIC(1) NOT NULL,
  CONSTRAINT hand_card_t1 PRIMARY KEY(card_game_id, user_id, hand_index)
)
/
