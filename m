From: akpm@linux-foundation.org (Andrew Morton)
Date: Fri, 9 Nov 2018 12:36:34 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181108041537.39694-1-joel@joelfernandes.org>
References: <20181108041537.39694-1-joel@joelfernandes.org>
Message-ID: <20181109123634.6fe7467bb9237851250c9c56@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109203634.0yhr8FDGkLANihUeClukjYHxUP5CgAfwjOMe5CBL-ek@z>

On Wed,  7 Nov 2018 20:15:36 -0800 "Joel Fernandes (Google)" <joel@joelfernandes.org> wrote:

> Android uses ashmem for sharing memory regions. We are looking forward
> to migrating all usecases of ashmem to memfd so that we can possibly
> remove the ashmem driver in the future from staging while also
> benefiting from using memfd and contributing to it. Note staging drivers
> are also not ABI and generally can be removed at anytime.
> 
> One of the main usecases Android has is the ability to create a region
> and mmap it as writeable, then add protection against making any
> "future" writes while keeping the existing already mmap'ed
> writeable-region active.  This allows us to implement a usecase where
> receivers of the shared memory buffer can get a read-only view, while
> the sender continues to write to the buffer.
> See CursorWindow documentation in Android for more details:
> https://developer.android.com/reference/android/database/CursorWindow

It appears that the memfd_create and fcntl manpages will require
updating.  Please attend to this at the appropriate time?

Actually, it would help the review process if those updates were
available now.
