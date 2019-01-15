From: john.stultz at linaro.org (John Stultz)
Date: Tue, 15 Jan 2019 09:36:52 -0800
Subject: [PATCH v4 1/2] mm/memfd: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20190112203816.85534-2-joel@joelfernandes.org>
References: <20190112203816.85534-1-joel@joelfernandes.org>
 <20190112203816.85534-2-joel@joelfernandes.org>
Message-ID: <CALAqxLXFvktP+k8AWPEoT=-MM_vdu=1hzgzPYEzhSp8hXd-ADg@mail.gmail.com>

On Sat, Jan 12, 2019 at 12:38 PM Joel Fernandes <joel at joelfernandes.org> wrote:
>
> From: "Joel Fernandes (Google)" <joel at joelfernandes.org>
>
> Android uses ashmem for sharing memory regions.  We are looking forward to
> migrating all usecases of ashmem to memfd so that we can possibly remove
> the ashmem driver in the future from staging while also benefiting from
> using memfd and contributing to it.  Note staging drivers are also not ABI
> and generally can be removed at anytime.
>
> One of the main usecases Android has is the ability to create a region and
> mmap it as writeable, then add protection against making any "future"
> writes while keeping the existing already mmap'ed writeable-region active.
> This allows us to implement a usecase where receivers of the shared
> memory buffer can get a read-only view, while the sender continues to
> write to the buffer.  See CursorWindow documentation in Android for more
> details:
> https://developer.android.com/reference/android/database/CursorWindow
>
> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
> which prevents any future mmap and write syscalls from succeeding while
> keeping the existing mmap active.
>
> A better way to do F_SEAL_FUTURE_WRITE seal was discussed [1] last week
> where we don't need to modify core VFS structures to get the same
> behavior of the seal. This solves several side-effects pointed by Andy.
> self-tests are provided in later patch to verify the expected semantics.
>
> [1] https://lore.kernel.org/lkml/20181111173650.GA256781 at google.com/
>
> [Thanks a lot to Andy for suggestions to improve code]
> Cc: Andy Lutomirski <luto at kernel.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>  fs/hugetlbfs/inode.c       |  2 +-
>  include/uapi/linux/fcntl.h |  1 +
>  mm/memfd.c                 |  3 ++-
>  mm/shmem.c                 | 25 ++++++++++++++++++++++---
>  4 files changed, 26 insertions(+), 5 deletions(-)

Acked-by: John Stultz <john.stultz at linaro.org>
