From: dancol at google.com (Daniel Colascione)
Date: Wed, 10 Apr 2019 08:44:54 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMgGFunOeMt93f57fPspdDSHp2twahhudEDhMvZ=VPJHaQ@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <79b6bdbc-890a-5a51-7fa1-aec57889046a@opersys.com>
 <CAOesGMgGFunOeMt93f57fPspdDSHp2twahhudEDhMvZ=VPJHaQ@mail.gmail.com>
Message-ID: <CAKOZueuQFiUVA2N0jj3cb6WkN1AjwDz2C+Q85W_spcjyMLYmjA@mail.gmail.com>

On Wed, Apr 10, 2019 at 8:16 AM Olof Johansson <olof at lixom.net> wrote:
> Anyway, see my other reply just now -- CPIO + a filesystem view, and
> providing said cpio archive in debugfs for those who want to copy it
> off themselves might be something that fits everybody.

I don't think it's worth increasing the complexity of the kernel for
the sake of a little userspace convenience. By including the headers
in the kernel, we solve an important coordination problem --- but we
should solve this problem in the simplest possible way, pushing
whatever complexity possible to userspace, which is more flexible and
which evolves faster. Providing a compressed archive is fine. The user
burden is not large: it's just extracting an archive from a standard
container format. The kernel has no special advantageous way of doing
this job. If userspace wants to cache extraction, it can hash the
compressed archive itself and use the result as a key: it's only 3MB.
But extracting the archive every time is fine. We're not talking about
a huge amount of data, and I don't see a need for the kind of
long-term caching that would require revalidation.

As for cpio vs tar: IME, people are much more familiar with the
latter, and they're both omnipresent on unixish systems. I think it's
fine to rely on a tool that's been part of POSIX for over 30 years.
