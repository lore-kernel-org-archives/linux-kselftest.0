From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 8 Mar 2019 05:42:32 -0800
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
Message-ID:
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190308134232.bFBiBI2wURDErQ9rAdwDVAIrTV2yoHaUoOkRLB4RJk8@z>

HI Geert,

On Fri, Mar 8, 2019, 3:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > It is just so much easier to use tar + xz at build time, and leave the
> > decompression task to the user. After decompression, the files will live on
> > the disk and the page-cache mechanism will free memory when/if the files fall
> > off the LRUs.
>
> I'm also considering how generic and extensible the solution is.
> What if people need other build artifacts in the future (e.g. signing key to
> load signed modules)?

That sounds like it could be useful. I don't see any reason off the
top why that would not be possible to add to the list of archived
files in the future. The patch allows populating the list of files
from Kbuild using ikh_file_list variable.

thanks,

 - Joel
