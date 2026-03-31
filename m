Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1028CF4A
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933513; cv=pass; b=TG2wOOTm808ASiQU2mUiO0LnMiVWyz0OfWET29yrdUA1+C+AgRb8kJUN4LO7uPCZ14B7fhUaX5owLfNQoAzSM5rMHArEKhxoSob7Oc7E+GFI0e1m0rd2l/kA5OFhTAMiDIntt79u36pZyXwatpX4w0l4+O/iWk/MqkkfcmguA0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933513; c=relaxed/simple;
	bh=Qwn+l80LXVGqXDK/Gg6LNCZ9W/+jw296C/myB+yUKto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=se+uEAvcFuP1ARqxG9u3+5kOt8vV+0T94M/ztEVxEouap61ywq3XUqp7E9Wh+OCJTpEuqnqBOCsL/4fVpqdftXEWVsNsXgTBjL80MPyU28SqLd2TQJXtGrK0cflVhwOd/xQlXLL7az1TNuJoxIn3CICWzTLGRwW00hbBhrSMEdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ssbrr19T; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ssbrr19T"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66bd3d05e03so2380401a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774933510; cv=none;
        d=google.com; s=arc-20240605;
        b=WKJu9BxzF2vdJTMdVchAXyxSZUxqt6BHz99VXaiq+F01gQTzZGqnRPX+xKxnSMo04M
         CxgW860FeoBlLz3A2WUgMgITJPq7TqTsBTxkwg2hdFBr+Zh2XQQzVJR93LLTuNYbjmKl
         y55niKWqv9qWSugdNYOw8epcw8lH4/A2w55xq0DtRmC9C24da/+U6GSZcDFzaMGEKxsi
         MBagptuXGzBAAsGkUZBC2IR5ifqvw9T3s0Atv5S/bqu5ZUom0GrciAGRYIe/ugQSpBbM
         USaZSZFuYUU6/MDxQfqY2/XN+9mld5RZXyYvcQVi/HZeH9Ylz1J3Nj+FWDx/4XUSFAsU
         nmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/q7nGaPvwDkPU9QIsHyO4ascwOjZnc/hpPdTloEKMHw=;
        fh=VNR0dc/Fd0h0260NzaJ0SID60b/uYBTySDdOsJN/XMs=;
        b=Dz5sCyvDsSPizDR/hFc6naZtlDznlgVnn1q2lHbJrA8b8HbplZ+XhpOEurxiDGC1SE
         XgbjAh69ooYIN80kCBu/GgDbqT+Fcbcy+XTHphFZIw667xaoEeSWRZ59DuxaUs53ztyx
         tyZ3ENJTlImRmaFyjr4PTTtS9OXbq8CkqgPJMflhMJUwEWLcDBGa3OWUQWGv+xocbd+E
         BzqTkSJCeLOM6PZ9lAepspUfOYciYXjpXUGXfZUZuq/vRVQsTMsyYDbN9UvG9uHo7VYa
         htJb49cdo8SiJrlHpipX/ubvr9vcpXmU1Hlu88KOPwll3Mcto+NpZADWa7i3GMBq3Ye+
         NGfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774933510; x=1775538310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/q7nGaPvwDkPU9QIsHyO4ascwOjZnc/hpPdTloEKMHw=;
        b=Ssbrr19TsVmLXjWQ7P2AWY/CgYOM8lw5F30z+19cwYV9w3FR4uGEnRQCzDQTRndD1m
         XhsLGO2sKfPKrkZXoBnhKUcflXwSTCEL9+r2z5NnazbTZ7Fozc311HMSo07kJJdc4eOd
         5CRxP6NojYH0+UroXY5NurZ2ynWzDkz5ppnlH43kwaJgugNjovZ/RNJgY7H1qNe2WUJr
         D6jiX+gt49Xm6HlPlsy1o681qMWhC26ji5Uq2r4gilAX8e5yYxjImYpZU3BQ42aXb9Px
         iCeQf2yEn0pQN8ozT1/jq5KYui00xlAy7QMjvU28zNS6bcKu0z3rXDAs8I7oC0lGyO1j
         +eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933510; x=1775538310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q7nGaPvwDkPU9QIsHyO4ascwOjZnc/hpPdTloEKMHw=;
        b=c4l/R/6Tzf5SYLVWRT+fmr4UGKrOyj3U9CxlSOgCXmuAANom/SbtuIndFlD0WexEK6
         rkZKHB5hef3v/Q2OvHAvAEZQLM2pddnbpYq0NMegHIfukxWMf4HPezvtVPFUugGgPJkn
         LnKUmlFkUiUExEjJm68ESrMFUJKokEUYtQoPJNaefXhxPG6X7Ne1KoatKkhmDlAWt26V
         OiTsDz77bVzw+rBZF6to3jmKLQ49vo5mq6GteW9MZldF+s7DLNi+v/Ll9NtAaZiPyi1/
         IwBdPuGyBkjvgfo1dxOE/AJ3C0ncdm1Fp2uwPP/5pixWDI/Io7gextgSkHOLy8ci085/
         8zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMOIsQYLyROWEa0azvqd7ARGUFXvpoBfheGfwcAzc1OVwkg4cGVWVofvb08YEOMUYB+gOsjFqkGylBajnkDGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YygQEBTmgEWxOszC8+Pd0fQwyR3qnLJPo2d/XAJaoQhZn7cLlU1
	oqZCI5bjYd0QwL+vU6NG8JXLzrcsna6mvp+LJV0YaCMS3oDZGvdjYl4wWhJJmS2DPgZGQ07aDgy
	yD9fpOeOB8Rpd8yFZSdT7YBxH6xVuaeU=
X-Gm-Gg: ATEYQzwcZD16uBHECa+jp7xLV5ctc/woCMB+BBOZYXhJX/bzdXudev8jvSBJOiZoCnd
	e9s5pWd7/Hyo7Ooz5CNkyWgjOs1NGtXkD920nMyxGXY3Gns5B4k35PqZEzRAC4Kyk9h9YVWpxbI
	sNsOrO7jtgAvW31byUNi5gTuiZoBXrhqeNvLIYUMZ0SNAmfgZCrCUg4UOH/rDw4bfvnA03Ryu4S
	KtDGb4DqmzYconj9Y7jNmg+HCv9buWNH5Yo6GdW127rO8ABoHzWI9ceGQ10ebHSrob8S7oTdqT+
	rW4jHZtjLUq5P3uyZCJn1wqSJwrzsiOliJXXqIY=
X-Received: by 2002:a17:907:e107:b0:b98:6c41:a758 with SMTP id
 a640c23a62f3a-b9b503580edmr703170666b.19.1774933510101; Mon, 30 Mar 2026
 22:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
 <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
 <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
 <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com>
 <CAADnVQJmqKVZC1gkvAaAmO9V=cnYPO0UYB6Wyp6Shko4tZeUQg@mail.gmail.com>
 <CADFiAcJCrS0wjkPcGU9sCYQukEoegeZG7JMkqhGDYq5C43nfXA@mail.gmail.com>
 <4b0e7341-f2e2-4ad2-8c9e-b482a1b1cbfb@linux.dev> <CADFiAc+4hKQGSEo9XRvrNuTTK4LXwCfAqPMR3AMxiNBtZTc4mw@mail.gmail.com>
 <f28c4e9f-eb44-4db8-844c-400bf66e88c1@linux.dev>
In-Reply-To: <f28c4e9f-eb44-4db8-844c-400bf66e88c1@linux.dev>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Tue, 31 Mar 2026 13:53:04 +0900
X-Gm-Features: AQROBzCo7EIfOPufrpoSMfBrCh8LtY87PMnpb5yyak4LI061krwDb9xLbbB0Xak
Message-ID: <CADFiAc+2aTWQbw9ZueJkP2qYxFNtTiLS+uFizBvX6jXq6PPeGw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> It is similar to xdp-ninja/xdp-dump.
>
> However, this idea has one more step forward: it is to trace the
> subprogs instead of only the main prog.
>
> For example,
>
> __noinline int subprog0(struct xdp_md *xdp) { bpf_tail_call_static(xdp,
> &m, 0); }
> __noinline int subprog1(struct xdp_md *xdp) { bpf_tail_call_static(xdp,
> &m, 1); }
> __noinline int subprog2(struct xdp_md *xdp) { bpf_tail_call_static(xdp,
> &m, 2); }
> SEC("xdp") int main(struct xdp_md *xdp)
> {
>         subprog0(xdp);
>         subprog1(xdp);
>         subprog2(xdp);
>         return XDP_PASS;
> }
>
> All of them, subprog{0,1,2} and main, will be traced.
>
> In this idea, it is to inject pcap-filter expression, the cbpf, using
> elibpcap [1], and to output packets like your xdp-ninja.
>
> It works well during the time I maintained an XDP project.
>
> [1] https://github.com/jschwinger233/elibpcap

Thank you very much for your kind reply.
elibpcap is a very interesting idea as well.

I had also considered whether making it __noinline might leave the
function prologue intact, so that it could be hooked via trampoline. I
actually tried that idea myself, but I had not yet been able to get it
working. I had not investigated it in enough detail, but I was
suspecting that it might already be expanded by JIT, which could make
that approach difficult.

That is why I thought it was excellent that you realized it by taking
the approach of inserting the logic there in the first place, rather
than trying to hook it afterward.

I had also been thinking about supporting use cases where packets need
to be captured only after some packet-related decision has already
been made in the program. For example, there are cases where the value
to match depends on runtime state, such as a Session ID that changes
whenever a tunnel is established. I think this kind of approach is
very helpful for such cases.

So, I was very happy to learn that someone else had been thinking
about a similar technique.

> It looks wonderful.
>
> I developed a similar tool, bpfsnoop [1], to trace BPF progs/subprogs
> and kernel functions with filtering packets/arguments and outputting
> packets/arguments info. However, it lacks the ability of outputting
> packets to pcap file.
>
> [1] https://github.com/bpfsnoop/bpfsnoop

Also, bpfsnoop looks like a very nice tool. I starred it on GitHub:)

Thank you very much again. I am very grateful that you shared such an
excellent idea with me.

Thanks,
Takeru
