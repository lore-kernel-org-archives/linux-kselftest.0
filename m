From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 31 May 2019 10:19:41 +0200
Subject: [PATCH v6 02/19] kernel: Define gettimeofday vdso common code
In-Reply-To: <20190530141531.43462-3-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-3-vincenzo.frascino@arm.com>
Message-ID:
 <CAK8P3a3Sr+MNbGQiMYt3RrE6SaYFPO-rXNoNvtOC7=qKE1kuYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190531081941.TTJfKs5PeZvMjW7RrNP16EZ3uw4_yS_AMXMXgCdOOjQ@z>

On Thu, May 30, 2019 at 4:15 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> +
> +static __always_inline notrace void vdso_write_end(struct vdso_data *vd)
> +{

Rather than marking every single function in here as "notrace",I think it
would be more robust to remove the '-pg' flag in the CFLAGS used for
compiling the vdso files.

       Arnd
