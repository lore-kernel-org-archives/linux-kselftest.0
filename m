Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D054E3ED3;
	Thu, 24 Sep 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282571; cv=none; b=D4klYkN6q2ThcdOXEIJBbJsa4evoIrTqEi2wQadC4SClh7oRWQUyAx+VicmhqEYCsqBIVsXoprJi6EukQRIjboVntIGQczOI5rt7WgpCbx690JLEgMYr2hVqn5oDL7n5TcKLzTAi4+CGOPJGFjsOG/9UC9irpaohcpv7HIHczCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282571; c=relaxed/simple;
	bh=rgyMcZ1hxQfLnC763Vt5oIN+skGnsnMhM7FcaGlKyXM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvFbVtq9fDtFzwOvkcTV46c6v7j3kXmuSzxlyskywurnGrSuhnNJo1u60oK8VTB43fZylpF5ZsjLCZYSiiUKAiEkPJ1ET4zLSxTNs8ur2QUXcXm4qWpMJFHS3ORpHPwNfozlWSo2mPejxprdjuwDeh5ASeBrhTR2QjRAhbOte8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNarXDUo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNarXDUo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5D31F000FF;
	Thu, 24 Sep 2026 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790282565;
	bh=rgyMcZ1hxQfLnC763Vt5oIN+skGnsnMhM7FcaGlKyXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SNarXDUoc03mlnStu/8u8U0/hi3loVlzewmGStWhr2zRXoZAZsbdbyRwTHAOySj2W
	 1AUm5+zkYnLrW14PJHgW0X4QZj1YirkCmQ0auGGjoLlDa6VsqcMeTD4woW13LuufWw
	 lDvZsIHO658b8ihfvpj3B3ZPugq+9LPhQe9nszwPAHexzMQj4bSHURzOd94usTLAD+
	 vJLAVj29NpfX3A5P2zWv/3kteuT6rU0GAm0oYo7MKUW/H7qI52F8o12S/zV7mJwpq3
	 6pfRyNquraoRMp4XY3nDdDOfyVQ/kaj+C3mF4kYH0lzqDiNN8kKArWAr8JrNfm4UrA
	 p/WMG7EZ0R5RQ==
Date: Thu, 24 Sep 2026 13:42:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jamal Hadi Salim <hadi@mojatatu.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org, Jiri Pirko
 <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Victor Nogueira <victor@mojatatu.com>,
 hybris <hybris@mojatatu.ai>, sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add duplicate action
 delete batch test
Message-ID: <20260924134244.1824ed80@kernel.org>
In-Reply-To: <CAAFAkD8goF-B2qP41roK8OipD7TRzZfVEdFDPxHddB5Tm6VhCQ@mail.gmail.com>
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
	<20260924103222.239e3d45@kernel.org>
	<CAAFAkD8goF-B2qP41roK8OipD7TRzZfVEdFDPxHddB5Tm6VhCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Sep 2026 16:09:16 -0400 Jamal Hadi Salim wrote:
> On Thu, Sep 24, 2026 at 1:32=E2=80=AFPM 'Jakub Kicinski' via Hyper-Yieldi=
ng
> Back-end Review & Insight System <hybris@mojatatu.com> wrote:
> >
> > On Tue, 22 Sep 2026 12:33:59 -0400 Jamal Hadi Salim wrote: =20
> > > Subject: [PATCH net 2/2] selftests: tc-testing: add duplicate action =
delete batch test =20
> >
> > ah, here's the 2/2 patch. Patchwork did not figure it out either :( =20
>=20
> repost? (2/2 was stuck on some ether).

Yes, please, repost
