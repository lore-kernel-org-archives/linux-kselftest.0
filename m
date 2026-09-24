Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249823EA942
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280580; cv=pass; b=b/rOex1ZTlltMT63QCeMLmfF+fwZcG1lZxLmFs1gemf7ho2++DWWlXg0bhDSC7rcFQ8gJP6oCvevwGCrH7uS8IHJ/zV8lhVcxQmbrJzPCYrbKyEfJYJ1PvRlMBjd+QrX8OulxxmubEO4FabjC7gB298oZrgr8vFtgKDNyxBbvls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280580; c=relaxed/simple;
	bh=Yz7JoaE6iquvpn6Unqqgb8gnd/A0MQ5SqMi49sUK7Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXRCKVy1A8dY57zlYF5Y+IYJ/GS+u70Jwm2Qz2L44deP6VlyxovYQ8tIgyep8SSt6p8UqmelaD5jxVBLP779Ct5+WPi7zlpvJ7+G6E4JrReDF3rvhNOpaGHzX7DkfbKzWVVjEhDsGZKh0SunCkv0WDPuOwmjTd0PlCRvKnWNiFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=CsmGZND0; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="CsmGZND0"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so174398c88.2
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 13:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790280569; cv=none;
        d=google.com; s=arc-20260327;
        b=IBxNWzbnyms4dXWyccUxLcpcYaf6C/R29bjb1D+c/AOREqlpqoRpz7feuo2Ag3B8sS
         ebkbak7ZmT+i7mizqF0T+rrB/6OcvopfmlJbMYAMCjmXPz+kj2QhaS1opCWyEbeuHO1F
         K9kI/dtjbOq5frKUpAoNmmRUSRhoaKYMUmIWRiHgwcaiz0vGQI8XRMxnETESvgcnvFQ6
         QczNDJwb/rzaKwzjZSVnUh5XN8xqKsy3L5vlBQOGq98a0VJioJZLgyWenK3plNhB/Rwh
         JZVb3NZxBhmapuq/kdmu3nQrIq5p87wnSLEPH6AipFMhbai0q0bcQUNgpY6Ey0XHKCfs
         2Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yz7JoaE6iquvpn6Unqqgb8gnd/A0MQ5SqMi49sUK7Zg=;
        fh=JV2uUlkPozzaZy4dGC3N9Hmn4qZBEi2Y+Wlg2PvNt9A=;
        b=a/eSQg1fM3SrdGNYce4cSsFN2iYQwLnyCiB9mLpwYfpz4Uu/LTgs51PDMyzrNn4XQT
         fov5ybkq2/wKhjhGcQgz7juzXYQWKt2HcgbopLruwP+F5IA484gdfrfaSKFjY0xCCf5N
         wHa8tV6iOr+kJjp328NIxtenNA95dbEOfVh3kd5/GKf/9M0ea6s0o3RKOr6zU8JkSs6d
         +gsTa8zydJT65rvZsg77knbSMhH7dWNXlQtbmVbo6rLatutARLoBs81YODLEdDtaWBCR
         KBsI34NEhjV4sR8CqcR77bQ8rNk/7nqDRwLGiIlLvhqiFIsvIkOrN3Bsza2+EX6XbSTA
         ayvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1790280569; x=1790885369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yz7JoaE6iquvpn6Unqqgb8gnd/A0MQ5SqMi49sUK7Zg=;
        b=CsmGZND0PTP1Jx3EJ4ZBqzwG+Jsi3/5sVOUyjApydhdJekVPYnAM241dyHZiTzN1ul
         HBYls6tPNKlbrLwRuj2JX0jueuLlzMh74X2rTlXjsEP/IsuwLR8XWrkL6x6TqIwf0Emz
         8oaNvdZhYlnzsVo8RTPCwHss9/49IV+aMhGiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280569; x=1790885369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yz7JoaE6iquvpn6Unqqgb8gnd/A0MQ5SqMi49sUK7Zg=;
        b=NfOnZhOnjzln4UHAbZGCA8zzYRiHIjcYSkbgZWHrggaaI3hy4iwC7YK2x77xIW30xv
         8kABcy/+04+JXBd7hEC1t86MDYTMpXAjHV5gwliFwFE6EObfJ1kmcz1fSOpMNNEbGPbP
         w5RMCEbuOsdhXuL5soV25PPFifdTO9p6IxE6/hLJcYyuJXLy6Lav++LOyOvcWxe2vivD
         oLcKoVqM0NdPU5w+Zdk2SVJk1MhiFkEAzSCm2kftIH0DYonapYRANF799ntNYcNF/f0p
         68ESRaSsxDsreFB8exAydJ8Fnt5viQOup7b4rhA1KgHXCgCg5meB2OqoDDjDcvVID3OQ
         +Lyg==
X-Forwarded-Encrypted: i=1; AKwUvBwITWjJCq2ANnBoP7TYH9MrgVw5igHGT9K1wTr2+zg+NeI/3ti4rAC8DuhHUaLO5llQ4pGubeeDNTqgtdtm620=@vger.kernel.org
X-Gm-Message-State: AFuF++mvtZGXnHK7AxMfEgL3ylMd53lFOt/8iWYs1RedMPEoSDE+NZVa
	nEvo/t8LqrisViKrbRQ1Vc+diz6ngNxVF5+i+NntV2PCcj03idl0CqP20dWMyUGOjLYgY5S3K+H
	ew9UOR/brYQOh+p3H241EVrpMX4/G3TVVXVl1IopXh0du3CzF4oXwLg==
X-Gm-Gg: AYBFou2zhkcpv7LIsjun9TjS6EI0dNfq2Y5tjLEcXqVI6+0LLCPkIFRdXWWcktvll30
	VJ4IVmdSAmdzKdRyZBpb6y3ryPtJVOBEqkrwbrSLZWTBao34Asp1OYsLden3oZygqG5et7fHO0A
	Hr415d64NrCVOp1koNWZHuJUQEUK1Nkp/0uO+mZRhlEo5O6aOawPhU0je2cUez/B1sJEkeTuAdK
	02Dn5J//Vrc7CN/zzV63D37shKWMFvN5gonfpxeybVopy7VA1xBZVGLaN8IMKvvfdV7N42vj1y4
	3f7dooHYM1de6/Alng42xvclDD8AGuiIckoK6rS8xqbd0Al+ptU9y39eoS0qIHqtt71XVQNmYnz
	O0JlRvbltc/TmNYDxAdGqA5P7TR753U5hFKyq5MwjGomruzeM1E3qmvN3SS9OVOgjYQ/243irgO
	iK+4lWp3nP9VBMOyhmoLPS20YacVambA==
X-Received: by 2002:a05:701b:21c8:b0:143:5c2a:e488 with SMTP id
 a92af1059eb24-14503f6e17amr2557112c88.0.1790280568819; Thu, 24 Sep 2026
 13:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2> <20260924103222.239e3d45@kernel.org>
In-Reply-To: <20260924103222.239e3d45@kernel.org>
From: Jamal Hadi Salim <hadi@mojatatu.com>
Date: Thu, 24 Sep 2026 16:09:16 -0400
X-Gm-Features: AclHuK8ging8rJ9iMqohghr3xW3SMPxgAhfGgpncxPI1dVhA27YT_H20sVXYQKs
Message-ID: <CAAFAkD8goF-B2qP41roK8OipD7TRzZfVEdFDPxHddB5Tm6VhCQ@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add duplicate action
 delete batch test
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, Victor Nogueira <victor@mojatatu.com>, 
	hybris <hybris@mojatatu.ai>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:32=E2=80=AFPM 'Jakub Kicinski' via Hyper-Yielding
Back-end Review & Insight System <hybris@mojatatu.com> wrote:
>
> On Tue, 22 Sep 2026 12:33:59 -0400 Jamal Hadi Salim wrote:
> > Subject: [PATCH net 2/2] selftests: tc-testing: add duplicate action de=
lete batch test
>
> ah, here's the 2/2 patch. Patchwork did not figure it out either :(

repost? (2/2 was stuck on some ether).

cheers,
jamal
