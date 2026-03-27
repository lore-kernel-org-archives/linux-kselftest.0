Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6172DF701
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 15:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624367; cv=pass; b=WlJ/QYdHwxdn7AwVPqX5Hc5RTilQmnaZ7LvXWTzop2nVwgDVJRiSC5SOB8y217N3hF3gDFW2wGuVEGt6WUmLBjxDbUPnn4ZN2cIAvGMZO0C4O/W7eOjgFzTc3YV1XF8DdeK0tdTxEix4hdRpQDKA4HjH6bQqIibfYFaNSyL0sZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624367; c=relaxed/simple;
	bh=aAAIIkwkpasgGtMXZcOI76PRHtjGQB/ePuh/XN13coo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvL8P4DDe3uEia6/Y1EUuqVyoZEpSXcoET3YVIHoWtxw831qkUkCBc+kp+vAYQB/Byj0vKHjy4rQg7GK7m+et47JPPdCAZu3Em7rUuFRdKs5IeIWBMvG/KfrlrgsjbnkY3KaCr8ib3T2cdjUqwBH3GBM+TXlVYynrUhR9szLJIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/Nv0w6E; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/Nv0w6E"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66b1019bb55so1786942a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 08:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774624364; cv=none;
        d=google.com; s=arc-20240605;
        b=avGNlpFfFc2ozqenQ/O7RrCUXbyBSo5qylBGtuxKE2HkHP7u8sKCr+zclowGCetgm8
         m70Vz0AQBHgj+D+DxROR/w54wzRAz87+IsqCNwiyE8fYFDKeJKjhyECxrCyjn+d75rN8
         zFyWfCziJXtbTESBm4lVqUjnVZOniV8A1xSm72Cd2TGsMzKJDQA/1xCTwICDJOFQ1NsM
         FayNoIXNVsSuc8u8Wrz1tmdzdUL7TDEG31gsZ/ozFcYUUvnZUSnVrnyMPReYBEPYV1d4
         J/fYcBspnxj2h9nkeIGhnDaWRJWc5LxMjn+8lFEr44b2pA82wZXWRrVw+5rkAzOcmI0S
         e72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aAAIIkwkpasgGtMXZcOI76PRHtjGQB/ePuh/XN13coo=;
        fh=ZlAGSOv0W8VJulf47oNB45d130EjalQcB4tdwsevb6E=;
        b=jRhLg2JSVZ4+hJdrR1T2V+4zdereEnukJKE1YdROn0QTrgMSB1EtnyvujTVsVK02l3
         GYcpv0ZWSZ7qJ5ylBjAFCbcdtX3y4KTbzE2O15wVwCH00lXYW7DwOAkrN/wu+lQSrRdx
         RlXs62QZCEKLGYMY4M+tnA1UZta9FfZQ7ROiEViZOLH0OBcQp441iJY0AmpbGTIfZaqM
         3/pkHezo5NkT+sYGczfW4EpmWgu7UxEIzh7TlvcQyZMV8MJIG98JtHcuY8Z8kJiue8AY
         aDpun7gtI2G2Gv8qitYxuJCK63wVNyzp2P4JxMCDz1Rt6ULw+uqYPAqRRgG9mXA0KswT
         HZfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624364; x=1775229164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aAAIIkwkpasgGtMXZcOI76PRHtjGQB/ePuh/XN13coo=;
        b=f/Nv0w6E4jgFvT3XWcSZB2E3D988dC10+Vr3O5znh252l9CVjFsfXAOEHxGgldo/Sk
         N4ah3imcjpxd3HohUaAfIQZR1o8rJ6SCgjESCvKtF/CCJZvB0Pp43JtBheQD4K+5W/1B
         pmnKRPh6oY7OoOO+hyf7VjO7HM0gSzeJKQUriLK/GNsGiiMOhX0fJhCN8DquwaQkqrTN
         42ifVXbZ1V+u1I21yxa0rlbXGjIIKXa/d6A/R7cs1N9CETzxj7dXAp2okmGzHwTaNIzJ
         /Ug/8FWoqLiGBJc97CZRmFP7KWkjQYa8dl80TUiNLlQ6PTsyjaZM0I0eafkGxmIMXrFD
         J+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624364; x=1775229164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAAIIkwkpasgGtMXZcOI76PRHtjGQB/ePuh/XN13coo=;
        b=TP4Pq8brMSa/mgbnyYSo3XsFjM10JoItqFxoxFdx4dSjxizqH1DagS/yyKvBVFNbhd
         k/Z2FBo3iYW5g0L5q65+0OtpMbkD2JyCkuXsIz6Fnxpfk1stNF1O9JsDPNAJaPGG+M9O
         QT7dIzVKeM1pV0iwUqOQyUzjYZuFiz4kf5CQuCtei2++nsKhnWn9XRX9r3le82s/VE6w
         kYPHwPyqA+8uOyd8fMKVLKHj5pDJMZPEtoJXHEiIWVcnBoqFzrcYLiKDVxCIgDaOPATk
         eYU45iQVwuykfZmoeddLPA2EjGe6oWx20AhPdgMrrDIn/llwMoo5K2J69sn4+IN/cq/4
         QCMg==
X-Forwarded-Encrypted: i=1; AJvYcCXfvQEWp5J/cQ7Qh42TM2rXkxPJkzPLLk2CesJgoItyBqkZj/y0JTpjB+UwaMUviz0bZcpyjjeO5vhZxgurYGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAoNYyRYuxDiwrnbjR4XBTxCSW4hx5sTXLcy98jDWG2MOM9P/n
	/oK+i3aYzd2fgg5D5y/RFQ2/aeSzmDjO5Q5ytVxeTxpxZtkWCwWNsy+TeS8FCA8/yOwlL5ZOAEo
	Ul8FiMN7chMxZFNPv/v5MifyOK6stCK8=
X-Gm-Gg: ATEYQzxNMnNJQu5zjWcfn/9Kx0DGJvIZTUj+RPDKtyA6zM0KV7QSHpTqxunHUBTym4l
	s3KpW3sNx5EVfsp/4liWAqkP/Aw9j5tzJ/ySzZ+NjJv2alKO75QiFu6i1RA5HN0QysltPfvhAmf
	ikXIzYwdvN2FzXIWaRzGR2SYcLoYSaF1zGhrVKxyTB6H0enkd2rAWVYbtUNAoo6DT0hFWNyf2J8
	TMlqqO9ijKplhqd4qhse+kieoBNY/UfYNTFyeANdjdR1bRrzHNfBi76dOBYC4qz/+WXBAOromOd
	Js2S+kOVubRHEbtD237BwA4xk/4ue1mhhNXHfsY=
X-Received: by 2002:a17:907:e158:b0:b96:d6cd:29e6 with SMTP id
 a640c23a62f3a-b9b503125a2mr158356266b.2.1774624363778; Fri, 27 Mar 2026
 08:12:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
In-Reply-To: <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Sat, 28 Mar 2026 00:12:30 +0900
X-Gm-Features: AQROBzDmYmczh2NyeEemAcGpDCom04u2Q6qw3Pd4PCsvZvk70saVT0NWa-U7xHw
Message-ID: <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexei

Thanks, and Sorry, I sent an older changelog from while I was still
iterating on this, and it described the issue incorrectly.

My changelog made this sound like an IBT/non-IBT-specific issue, but
that was wrong. On current kernels, fentry on tail-called programs is
not supported in either case. Only the regular fentry patch site is
patched; there is no tail-call landing patching in either case, so
disabling IBT does not make it work.

What this series was trying to do was add support for fentry on
tail-called x86 programs. The non-IBT part was only about a bug in my
initial implementation of that support, not the underlying motivation.

The motivation is observability of existing tailcall-heavy BPF/XDP
programs, where tail-called leaf programs are currently a blind spot for
fentry-based debugging.

If supporting fentry on tail-called programs is still not something
you'd want upstream, I understand. If I resend this, I'll fix the
changelog/cover letter to describe it correctly.
