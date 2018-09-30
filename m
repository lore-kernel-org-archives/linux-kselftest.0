From: peterx@redhat.com (Peter Xu)
Date: Sun, 30 Sep 2018 15:42:56 +0800
Subject: [PATCH v2 0/3] userfaultfd: selftests: cleanups and trivial fixes
Message-ID: <20180930074259.18229-1-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180930074256.C1rYZjgveHHvhML9lpkF07F34l-aWxGoIvHX0OTZlwQ@z>

v2:
- add a-bs
- add examples for non-anon tests [Mike]
- use brackets properly for nested ifs [Mike]

Recently I wrote some uffd write-protection test for the
not-yet-published uffd-wp tree, and I picked these common patches out
first for the selftest which even suite for master.

Any feedback is welcomed.  Please have a look, thanks.

Peter Xu (3):
  userfaultfd: selftest: cleanup help messages
  userfaultfd: selftest: generalize read and poll
  userfaultfd: selftest: recycle lock threads first

 tools/testing/selftests/vm/userfaultfd.c | 134 +++++++++++++----------
 1 file changed, 77 insertions(+), 57 deletions(-)

-- 
2.17.1
