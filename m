From: jannh@google.com (Jann Horn)
Date: Thu, 23 May 2019 16:32:14 +0200
Subject: [PATCH v1 1/2] open: add close_range()
In-Reply-To: <20190523115118.pmscbd6kaqy37dym@brauner.io>
References: <20190522155259.11174-1-christian@brauner.io>
 <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
Message-ID:
 <CAG48ez0Uq2GQnQsuPkNrDdJVku_6GPeZ_5F_-5J3iy2CULr0_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523143214.1d-ziMpMbXLGRvG4bGtL5qqejMtX2UARpwXAcEJRm_8@z>

On Thu, May 23, 2019@1:51 PM Christian Brauner <christian@brauner.io> wrote:
[...]
> I kept it dumb and was about to reply that your solution introduces more
> code when it seemed we wanted to keep this very simple for now.
> But then I saw that find_next_opened_fd() already exists as
> find_next_fd(). So it's actually not bad compared to what I sent in v1.
> So - with some small tweaks (need to test it and all now) - how do we
> feel about?:
[...]
> static int __close_next_open_fd(struct files_struct *files, unsigned *curfd, unsigned maxfd)
> {
>         struct file *file = NULL;
>         unsigned fd;
>         struct fdtable *fdt;
>
>         spin_lock(&files->file_lock);
>         fdt = files_fdtable(files);
>         fd = find_next_fd(fdt, *curfd);

find_next_fd() finds free fds, not used ones.

>         if (fd >= fdt->max_fds || fd > maxfd)
>                 goto out_unlock;
>
>         file = fdt->fd[fd];
>         rcu_assign_pointer(fdt->fd[fd], NULL);
>         __put_unused_fd(files, fd);

You can't do __put_unused_fd() if the old pointer in fdt->fd[fd] was
NULL - because that means that the fd has been reserved by another
thread that is about to put a file pointer in there, and if you
release the fd here, that messes up the refcounting (or hits the
BUG_ON() in __fd_install()).

> out_unlock:
>         spin_unlock(&files->file_lock);
>
>         if (!file)
>                 return -EBADF;
>
>         *curfd = fd;
>         filp_close(file, files);
>         return 0;
> }
>
> int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> {
>         if (fd > max_fd)
>                 return -EINVAL;
>
>         while (fd <= max_fd) {

Note that with a pattern like this, you have to be careful about what
happens if someone gives you max_fd==0xffffffff - then this condition
is always true and the loop can not terminate this way.

>                 if (__close_next_fd(files, &fd, maxfd))
>                         break;

(obviously it can still terminate this way)

>                 cond_resched();
>                 fd++;
>         }
>
>         return 0;
> }
