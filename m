From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 9 Nov 2018 19:54:43 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181109123634.6fe7467bb9237851250c9c56@linux-foundation.org>
References: <20181108041537.39694-1-joel@joelfernandes.org>
 <20181109123634.6fe7467bb9237851250c9c56@linux-foundation.org>
Message-ID: <20181110035443.GA26579@google.com>

On Fri, Nov 09, 2018 at 12:36:34PM -0800, Andrew Morton wrote:
> On Wed,  7 Nov 2018 20:15:36 -0800 "Joel Fernandes (Google)" <joel at joelfernandes.org> wrote:
> 
> > Android uses ashmem for sharing memory regions. We are looking forward
> > to migrating all usecases of ashmem to memfd so that we can possibly
> > remove the ashmem driver in the future from staging while also
> > benefiting from using memfd and contributing to it. Note staging drivers
> > are also not ABI and generally can be removed at anytime.
> > 
> > One of the main usecases Android has is the ability to create a region
> > and mmap it as writeable, then add protection against making any
> > "future" writes while keeping the existing already mmap'ed
> > writeable-region active.  This allows us to implement a usecase where
> > receivers of the shared memory buffer can get a read-only view, while
> > the sender continues to write to the buffer.
> > See CursorWindow documentation in Android for more details:
> > https://developer.android.com/reference/android/database/CursorWindow
> 
> It appears that the memfd_create and fcntl manpages will require
> updating.  Please attend to this at the appropriate time?

Yes, I am planning to send those out shortly. I finished working on them.

Also just to let you know, I posted a fix for the security issue Jann Horn
reported and requested him to test it:
https://lore.kernel.org/lkml/20181109234636.GA136491 at google.com/T/#m8d9d185e6480d095f0ab8f84bcb103892181f77d

This fix along with the 2 other patches I posted in v3 are all that's needed. thanks!

- Joel
