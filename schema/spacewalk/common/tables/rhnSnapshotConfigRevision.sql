--
-- Copyright (c) 2008--2012 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--


CREATE TABLE rhnSnapshotConfigRevision
(
    snapshot_id         NUMBER NOT NULL
                            CONSTRAINT rhn_snapshotcr_sid_fk
                                REFERENCES rhnSnapshot (id)
                                ON DELETE CASCADE,
    config_revision_id  NUMBER NOT NULL
                            CONSTRAINT rhn_snapshotcr_crid_fk
                                REFERENCES rhnConfigRevision (id),
    created             timestamp with local time zone
                            DEFAULT (current_timestamp) NOT NULL,
    modified            timestamp with local time zone
                            DEFAULT (current_timestamp) NOT NULL
)
ENABLE ROW MOVEMENT
;

CREATE UNIQUE INDEX rhn_snapshotcr_sid_crid_uq
    ON rhnSnapshotConfigRevision (snapshot_id, config_revision_id)
    TABLESPACE [[2m_tbs]];

CREATE INDEX rhn_sscr_crid_idx
    ON rhnSnapshotConfigRevision (config_revision_id)
    TABLESPACE [[2m_tbs]];

