From: David.Laight@ACULAB.COM (David Laight)
Date: Thu, 23 May 2019 16:29:44 +0000
Subject: [PATCH v1 1/2] open: add close_range()
In-Reply-To: <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
References: <20190522155259.11174-1-christian@brauner.io>
 <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
Message-ID: <5e57c26cb7044b69acd3846ac474b5d5@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523162944.QH-U6C9SwQ1FUa_I3_KcaIChE4VMC9mtli9abYo17JE@z>

From:  Konstantin Khlebnikov
> Sent: 23 May 2019 17:22
....
>  > In addition, the syscall will also work for tasks that do not have procfs
>  > mounted and on kernels that do not have procfs support compiled in. In such
>  > situations the only way to make sure that all file descriptors are closed
>  > is to call close() on each file descriptor up to UINT_MAX or RLIMIT_NOFILE,
>  > OPEN_MAX trickery (cf. comment [8] on Rust).

Code using RLIMIT_NOFILE is broken.
It is easy to reduce the hard limit below that of an open fd.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
