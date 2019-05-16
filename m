From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 16 May 2019 11:43:03 -0700
Subject: [PATCH bpf-next 0/2] Move bpf_printk to bpf_helpers.h
In-Reply-To: <20190516112105.12887-1-mrostecki@opensuse.org>
References: <20190516112105.12887-1-mrostecki@opensuse.org>
Message-ID:
 <CAADnVQLFrZyjbFb6o0YezLyqGBKcsiT=jVGfwDaupGLvgLp31A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516184303.2QFLIawivG-rEerbxj1ENN6_fLNBVXmdurjo5n5HCA4@z>

On Thu, May 16, 2019@4:21 AM Michal Rostecki <mrostecki@opensuse.org> wrote:
>
> This series of patches move the commonly used bpf_printk macro to
> bpf_helpers.h which is already included in all BPF programs which
> defined that macro on their own.

makes sense, but it needs to wait until bpf-next reopens.
