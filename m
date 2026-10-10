Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D83D6664
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613565; cv=none; b=QOQE0OganYr0LM0+287R8juHCHQLRAOIDurmj7HjNM8eg8WnzenrlqbGP639NlO/t8pIkxUlzqAyJAaUn1x8eXLwAx0GVROrpIasm0jR1MlpfKjw4C1bh9SoF+OGtZW08acbhuyfelGLqspIiCIQYUlPP5bemW46a2vvUI/rGDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613565; c=relaxed/simple;
	bh=/VwFVEy1ksMMQ3bDcdEpkKJrBuTWhaaB1+PgMhDl+NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMCbfGfwZoih3msk/gHycfr7Cb5FN27PLFxD18zvDtnYmm00E2I5nVMwiSc74V6FEws4Yw3r9oZiTBoBjihcwDsLEkssFpVaiN4nrMJrtyv9n50svN+eP4WucoG/2/TBo2At4b9TjZXBtC85/7+aoHNGxsk2MLa4/bfCZtVjToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWrOt/mH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWrOt/mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551171F008A2
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791613564;
	bh=/VwFVEy1ksMMQ3bDcdEpkKJrBuTWhaaB1+PgMhDl+NI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aWrOt/mHYDK1fRzSEWkvZcJWJfDgy8A+sFPJ1h/jBwJR8SD+f0cufmBh6w63N0dEL
	 1ILNheCdWPUdTstwTTjrmwB7h0l7zk2lpJjUpIQVEo3nYsYgFTRFDG8Qg6qCHMg/41
	 /oo5fMVe6TjANwCTu47Uqxq27autStv7XcA1FmQ2BDurby8i+af2KZOG/J335Sj+1d
	 +BRVEjRnvbXd4uKg7glwrEU+hPKvfHyoLMX/wodh5H1h6zMnCDZGxWXuHz8GwjRXq8
	 qS/VRjVsDLvagqBdAzui153F7bMXn3w6S03s6UoQ70VKHVZkkDSQSAAC19Vy6Puf8K
	 CAIrdqa8O5Kvg==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49dee4c5427so239290fac.2
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 23:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZAOl4yZwn30OSa+84lnXqZIc7R0NIx2DD0n7dv3gcNvigRQMMG23PXBWP13+0y2Cvwaw/PjkOmO5QdXWYQAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4HD6HS9QyawSyokMooYr2Rwfmhy4pUPlu0D4IQCeUQA5uYD4Q
	S8sxkQnUK18VJygAeV062PjPOHIW9KAuYQQ0F5EcENo71gaQdBlOjhWnG51iGAszCuYieT0fUNx
	5pH/7cKVYc/BU4GtmJ53g1Ie/Fiza9aE=
X-Received: by 2002:a05:6870:c272:b0:47c:2737:edd0 with SMTP id
 586e51a60fabf-4a2a86c4673mr3263725fac.1.1791613563536; Fri, 09 Oct 2026
 23:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com>
 <20261009171447.291802-1-ncardwell.sw@gmail.com>
In-Reply-To: <20261009171447.291802-1-ncardwell.sw@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 10 Oct 2026 08:25:52 +0200
X-Gmail-Original-Message-ID: <CAL4Wiir8_sh3pS=DGTG=iqLstnHbxf0dWQgk0O0b0oferN69=w@mail.gmail.com>
X-Gm-Features: AclHuK8OXj7pbT2oTIRY8DcZBjiXkMGrnNSUYf07pfEkmQ7cCLqcw1rz21aj6Ok
Message-ID: <CAL4Wiir8_sh3pS=DGTG=iqLstnHbxf0dWQgk0O0b0oferN69=w@mail.gmail.com>
Subject: Re: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback
 after partial undo
To: Neal Cardwell <ncardwell.sw@gmail.com>
Cc: davem@davemloft.net, horms@kernel.org, jiayuan.chen@linux.dev, 
	kuba@kernel.org, kuniyu@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	nramaswamy@openai.com, pabeni@redhat.com, shuah@kernel.org, ycheng@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 oct. 2026 =C3=A0 19:15, Neal Cardwell <ncardwell.sw@gmail.com> a =
=C3=A9crit :
>
> From: Neal Cardwell <ncardwell@google.com>
>
> On Fri, Oct 9, 2026 at 1:47#AM Eric Dumazet <edumazet@kernel.org> wrote:
>
> > Let me come back to tp->tsorted_lost_queue [1]. I was too terse there
> > ("often") and it did not get discussed.
>
> Thanks, Eric. Given that you are OK with the space overhead for a new
> tp->tsorted_lost_queue field, I think it would be quite nice to use your
> suggested approach, since it should give us better loss recovery behavior=
.
>
> FWIW, I asked an LLM to code up your idea, and below is what it came up w=
ith,
> in case that is useful for discussion or using. It also proposed 2 packet=
drill
> tests (one that claims "This is the case that Eric suggested for segments=
 with
> TCPCB_EVER_RETRANS."), which I can post if there is interest.
>

Excellent, thanks Neal. I will take a deeper look on Monday.
