From: joel@joelfernandes.org (Joel Fernandes)
Date: Sat, 12 Jan 2019 15:38:14 -0500
Subject: [PATCH v4 0/2] Add a future write seal to memfd
Message-ID: <20190112203816.85534-1-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190112203814.0IIk_NJISHgdzfdk8Bh4IjL3KrbHj2zXE812AyHVRWI@z>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

This is just a resend of the previous series at
https://lore.kernel.org/patchwork/patch/1014892/
with a small if block refactor as Andy suggested:
https://lore.kernel.org/patchwork/comment/1198679/

All,
Could you please provide your Reviewed-by / Acked-by tags?

I will also resend the manpage changes shortly.

Joel Fernandes (Google) (2):
mm/memfd: Add an F_SEAL_FUTURE_WRITE seal to memfd
selftests/memfd: Add tests for F_SEAL_FUTURE_WRITE seal

fs/hugetlbfs/inode.c                       |  2 +-
include/uapi/linux/fcntl.h                 |  1 +
mm/memfd.c                                 |  3 +-
mm/shmem.c                                 | 25 +++++++-
tools/testing/selftests/memfd/memfd_test.c | 74 ++++++++++++++++++++++
5 files changed, 100 insertions(+), 5 deletions(-)

--
2.20.1.97.g81188d93c3-goog
