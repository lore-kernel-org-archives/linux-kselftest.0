Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5F3C0631
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218091; cv=pass; b=hUBv/ZB3SYFm9kc/xn6++7Y7qVBdEyumCU6Wz6clpvYO27jHFqsYRLyT+KdAQDbqR9q/klDAPdmx7D6SaCFtDpEccEqmC110CIT9AWgnc6Zv9Sq5gZxoIxzOZt1yK2dvS/x10S8cerDrjdWlNtIttEoZGplOzawrlMGHD5pi6Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218091; c=relaxed/simple;
	bh=SsapxUY06a7cs9bBuRB3R8cKxgdqx7oMrI3eEaj8qe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDPhjM3gHpwKeoOJeaADR2pROo2VvE1D69b771mGLOt7qdIKU/FrEDGH6I6vexA/4FoVZ4JdLdXMAWMBxr8awm+4cx9wOTc3udQ82Seo/whnr3FH9zZREONJVGmhfpYaOoTt4ey5ghx0JWIRYKGz1qKzWWFI8Iyz2Yw0o2GTVCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hlk4Q8yu; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hlk4Q8yu"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509101189edso31582611cf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 01:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773218084; cv=none;
        d=google.com; s=arc-20240605;
        b=OBEDlJgKyTJuiRBdLlazfxKsQWybKzu1YoUgUi++Ff4lhXI1MWOp8T03tRzZeGWxO1
         MRTeT8138Pc3V+7jzAbBZnelh/esWuxUxkd+FW0eG3nBa7uEhhcOEQnxEKqBoGOwkDTY
         xYGsZLilagaGeslcDxiI8yEHSTtMkafHz7+Ic3gGdjJ/hBKTIw7vrvRawDhPl9nPmaWL
         1HdzbyGPoyKgyrPvLl0fSMylIXx8jyIVh+aTJ4HagkCKe3kIXb/3peeGWJ1ABZ4Eo11y
         7gRe8L+M7kvmjhrixjdEI0+Ft3EzPUmOt+6frb3od8eHjU4AJ6GIhzUyd53h+yzB/j/r
         MaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        fh=toxYHkkP115RpXcuWBgCHCAsFbTO4JQXU4CHrUEMcfE=;
        b=d6nRxb6RwdEeDTAxq3RCjCNF1wJ2EAja9Ymzl8XVvQibngrIiRRNKAPI1E9EmZnkuk
         rZZQDhJYCbbcWOWqGt271+wxcAx1i0O/j1yk9ERnx+Vs2jerP4o6P4aUu+QL1M66CKVy
         hYYv90jRz58ieSpkbCJJ8R/CCSe2E2cjjzCB3BibRiDgL/vLyiVMCqm6+kRnMG6bqMgG
         mXSAx8FfTSTOLhN8pZpWVcyHJyth+nWiEwjVzCQSCe6BWNw9V6NqdxMYNy2N++zzfPHr
         XvcmqEqwlrSaY5KX/PAN9AZvr9mZjLrAIwxMjnzo1BwPSU3OYZEdLohyZMfV2/UgAeU0
         l2KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773218084; x=1773822884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        b=hlk4Q8yuViuaZ1defw2+7C1/3pvIVJguTIjEDJ+mqoYMaxn6LVrLcHXfndrlvY7qzu
         rhrSJ8jHMNez9R37G8qhA868kTE64M7NLAFtnUWyJxkpUg+7VuKzbrlm8TbozbcriFdm
         aTOoQJMBsDG6mZsab2j5c3+Up/oNto26+SNMFS+nh7j97f0rFlqEMLHwhrUzhPw2ouOx
         k/H08RstCdFj5vaN3KiYkGmrMydgtowhs1KeWl/YrfsHewWHCtbc89umaMT92PSVKvSg
         qcZBsClFH8t0EfRf4DIFzLXGU9mGpp+bIHiX7Yui7/SFApAe3RCMSdi2mkx28cO4GbMQ
         FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218084; x=1773822884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        b=MdjbAz/itBz6xzHjbDJ5cl2EeBPCCSwF4F9isISMdF6/grXRKRV3W2Z6Trr8djpF/9
         C2k5o3yEzpGe1MQyw42e9eapprItWdFlUO7DAypwlx4gmqngc9Vya8MedX8JLqR0SQGi
         rodZUufRU3TiCHaHJQoedTn0uvieI9btzNzTzKrWG4h34hS6hPlqfFL5teYOLIQxiTyX
         Md2dGHnKvS6DIvUt69IXx+zb4I7tYFlHg43B+5xXAfzkf3YFsbvznTdnWPoyuIOt2z5L
         w+OVI4DnIOlsaSuX1aIMUg2Hr16ctaQHstlaRiJE5Ct6GbIxqJj/Ivc4fvi2gZzGWV6T
         H9FA==
X-Forwarded-Encrypted: i=1; AJvYcCWmEWpbcPy5563fORLCEwL4gwEUrFj/YJYZHf+fSrygj96WGFdZ+DWoLQaCiBl738xRe2pMYrgApgQ2HGlwkcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoE5zNG3uZQ12IR1kZiJvKCpnIsGuoFz15SatS0T6LfASi1hY
	xxlT+g2Xpkfu4iWWgfRgV2Tmi5nmyv638cDEz4wqgAQfvBugxvGVZBQNKQT9JUchKtATLG9pHz6
	qMarfbXl8Z8UAavYq5PSh6TPCVxbklvSWJOGsXQIF
X-Gm-Gg: ATEYQzw+3mycSRs3b/gqpYS35u1ds1AWb8HC8foabjhCjxZe4tH+NdiTaioUxpYRhyw
	QrW2bzDsQodbSlFwTkHPVluIdimBotX1R9yX/38TefZP05RLUi3WDlT+7ME6cFO5f238rPaFGZH
	yN5BPKz0zBZerhyhdIL6wiFKBU2i/l0z1UMCOD+yURu83Yh5kcEaeK2xd4T1wmngYEC/eLCe8Cl
	ViT5F8z4I4ykHevxZW4O3QSzc9o5yOO0B5F/9AE5x8vFVYy/ItK7zAg0kYfXVUiSqMJX6GgXBiY
	4mGbHwcc
X-Received: by 2002:ac8:5f89:0:b0:509:20de:4ada with SMTP id
 d75a77b69052e-5093a18950amr18737181cf.48.1773218083994; Wed, 11 Mar 2026
 01:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311075600.948413-1-atwellwea@gmail.com>
In-Reply-To: <20260311075600.948413-1-atwellwea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 11 Mar 2026 09:34:32 +0100
X-Gm-Features: AaiRm52wCKdcSWz9oNAzUWL_GQOag0jSamOEmON1h9c132p0nbosojJsMVy1eJA
Message-ID: <CANn89i+dojcg=TDh6E1++g_TM7qdcpnyu47n2Q9DRW_w73TjzA@mail.gmail.com>
Subject: Re: [PATCH net 0/7] tcp: preserve advertised rwnd accounting across
 receive-memory decisions
To: Wesley Atwell <atwellwea@gmail.com>, Simon Baatz <gmbnomis@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, dsahern@kernel.org, matttbe@kernel.org, 
	martineau@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	kuniyu@google.com, horms@kernel.org, geliang@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com, 
	linux-doc@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:56=E2=80=AFAM Wesley Atwell <atwellwea@gmail.com>=
 wrote:
>
> This series keeps sender-visible TCP receive-window accounting tied to th=
e
> scaling basis that was in force when the window was advertised.
>
> Problem
> -------
>
> `tp->rcv_wnd` is an advertised promise to the sender, but later
> receive-memory admission and clamping could reconstruct that promise
> through the mutable live `scaling_ratio`. After ratio drift, the stack
> could retain or advertise a receive window that no longer matched the
> local hard rmem budget.
>
> Fix
> ---
>
> - store the advertise-time scaling basis alongside `tp->rcv_wnd`
> - refresh that pair at the TCP and MPTCP receive-window write sites
> - consume the snapshot in receive-memory admission, clamping, and the
>   scaled-window quantization path
> - preserve the snapshot across `TCP_REPAIR_WINDOW` restore when userspace
>   provides it, and fall back safely when legacy userspace cannot
> - expose the accounting in tracepoints and cover the ABI/runtime contract
>   in selftests
>

Your series will heavily conflict with Simon's one

https://patchwork.kernel.org/project/netdevbpf/list/?series=3D1063486&state=
=3D%2A&archive=3Dboth

I suggest you rebase/retest/resend after we merge it.

> Series layout
> -------------
>
> 1. track the receive-window snapshot state and helpers
> 2. refresh the snapshot when TCP advertises or initializes windows
> 3. use the snapshot in receive-memory admission and clamping
> 4. extend `TCP_REPAIR_WINDOW` for exact restore plus legacy compatibility
> 5. refresh the TCP shadow window snapshot in MPTCP
> 6. expose rmem/backlog state in `rcvbuf_grow` tracepoints
> 7. cover legacy and extended repair-window layouts in selftests
>
> Testing
> -------
>
> - `git diff --check origin/main..HEAD`
> - `scripts/checkpatch.pl --strict --show-types` on patches 1-7
> - `make -j8 headers`
> - `make -j8 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minis=
ocks.o net/ipv4/tcp.o`
> - `make -j8 C=3D1 CF=3D'-D__CHECK_ENDIAN__' W=3D1 net/ipv4/tcp_input.o ne=
t/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
> - `make SPHINXDIRS=3D'networking/net_cachelines' htmldocs`
> - `make -j8 vmlinux bzImage modules`
> - `make -C tools/testing/selftests/net/tcp_ao -j8`
> - `make -C tools/testing/selftests/net/mptcp -j8`
> - `packetdrill --dry_run` for `tcp_rcv_toobig.pkt` and
>   `tcp_rcv_toobig_default.pkt`
> - `virtme-run` guest pass for both packetdrill tests
> - feature-enabled guest pass for `restore_ipv4`, `self-connect_ipv4`, and
>   `mptcp_sockopt.sh`
>
> Thanks,
> Wesley
>
> ---
> base-commit: 908c344d5cfa0ee6efb3226d22ea661e078ebfa0
> --
> 2.43.0
>
