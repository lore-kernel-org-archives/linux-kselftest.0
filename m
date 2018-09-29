From: peterx at redhat.com (Peter Xu)
Date: Sat, 29 Sep 2018 16:43:08 +0800
Subject: [PATCH 0/3] userfaultfd: selftests: cleanups and trivial fixes
Message-ID: <20180929084311.15600-1-peterx@redhat.com>

Recently I wrote some uffd write-protection test for the
not-yet-published uffd-wp tree, and I picked these common patches out
first for the selftest which even suite for master.

Any feedback is welcomed.  Please have a look, thanks.

Peter Xu (3):
  userfaultfd: selftest: cleanup help messages
  userfaultfd: selftest: generalize read and poll
  userfaultfd: selftest: recycle lock threads first

 tools/testing/selftests/vm/userfaultfd.c | 131 +++++++++++++----------
 1 file changed, 74 insertions(+), 57 deletions(-)

-- 
2.17.1
