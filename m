From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 8 Mar 2019 15:02:51 +0100
Subject: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
Message-ID: <20190308140251.GC25768@kroah.com>

On Fri, Mar 08, 2019 at 05:42:32AM -0800, Joel Fernandes wrote:
> HI Geert,
> 
> On Fri, Mar 8, 2019, 3:53 AM Geert Uytterhoeven <geert at linux-m68k.org> wrote:
> > > It is just so much easier to use tar + xz at build time, and leave the
> > > decompression task to the user. After decompression, the files will live on
> > > the disk and the page-cache mechanism will free memory when/if the files fall
> > > off the LRUs.
> >
> > I'm also considering how generic and extensible the solution is.
> > What if people need other build artifacts in the future (e.g. signing key to
> > load signed modules)?
> 
> That sounds like it could be useful. I don't see any reason off the
> top why that would not be possible to add to the list of archived
> files in the future. The patch allows populating the list of files
> from Kbuild using ikh_file_list variable.

Um, no, you don't want the signing key in the kernel itself, as that
totally defeats the purpose of the signing key :)

greg k-h
