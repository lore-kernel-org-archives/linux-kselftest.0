From: mrostecki at opensuse.org (Michal Rostecki)
Date: Fri, 17 May 2019 21:50:58 +0000
Subject: [PATCH bpf-next 0/2] Move bpf_printk to bpf_helpers.h
In-Reply-To: <CAADnVQLFrZyjbFb6o0YezLyqGBKcsiT=jVGfwDaupGLvgLp31A@mail.gmail.com>
References: <20190516112105.12887-1-mrostecki@opensuse.org>
 <CAADnVQLFrZyjbFb6o0YezLyqGBKcsiT=jVGfwDaupGLvgLp31A@mail.gmail.com>
Message-ID: <20190517215058.GA10873@wotan.suse.de>

On Thu, May 16, 2019 at 11:43:03AM -0700, Alexei Starovoitov wrote:
> On Thu, May 16, 2019 at 4:21 AM Michal Rostecki <mrostecki at opensuse.org> wrote:
> >
> > This series of patches move the commonly used bpf_printk macro to
> > bpf_helpers.h which is already included in all BPF programs which
> > defined that macro on their own.
> 
> makes sense, but it needs to wait until bpf-next reopens.

Sorry for that! Please apply the v2 patch when bpf-next repoens.
