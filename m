Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BF3B05BB
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780252; cv=pass; b=kfFBcxXy2cUuzRuyB8xw2w+MKnTkUC19fhv+IpK88wTjGkYLa+ohQYFitik4e3px9KY1X/584RE1H9Ax7AYTF1ToUvqH9Ct+sJY2CLGuVM5Td9F8SsD4wSxRGomVGMm6RNLSu/0Wk6iHFezMNO3jx2443gCjo0+yzbTJnSyCA90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780252; c=relaxed/simple;
	bh=iGzdbSllr8QjJeo+SoUN85/5fREjJOEUukH1vTN+KoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDt6jynaqLQd8p6N+R2QER408tdgmqk84mJNrtSEEynXKMO4dZFA7vQyDdFMI+/GgUuALjCOEt4ZQWNLlZgURsiBYv20XeQuvLg5jjBSPE1zxRTrIzgBg4mmQHQkqbJCl3ztCdzi2xdoQrglEfUjO79r8FgS9cH05Q6rXl/WUnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku5ZZPbI; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku5ZZPbI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso1267717e87.2
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 18:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789780247; cv=none;
        d=google.com; s=arc-20260327;
        b=e85nEvUfblfuwwa8HbL2VNLEGajI350wMuOJ+PIMnqUkkkuIgKd5fV0Ppn8Fzz7Ukk
         U632eE2pGB8QVgdbFrbvgedYtkCbma06EymznpC45cbowBstJO2yfwuXO0TaBx9fWkPL
         577hcwFrQleRoDTfaV8pILFXQg/wraBvGzAG42FG6rlWuXcqw/qzh6jCe21DejY35pZ7
         6zSqkoZsH88MCzbtl3S0iCqyQ6mEMvdrZfKR8YhP2hIepvjbIuLoF5cjhjEau4+O06Le
         WoP/ne6Mu9c0PAWtjrx2iPowLAHUu7ESTTyA+s0k8HNz7nq2d5webfqRs5r6k1AoMADr
         GLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        fh=yDcADeC4spJNFH5y29y3OAtn4m7g2AXUVi16zmHC0K8=;
        b=bZQfjtvotFTGMTPkoPssvbNiNhZNepi6DdPyntlKAYXYw/yO/AmOLaSVifgoN0icEQ
         H9SGmhH0RHAnsaXWp8KZqo1f0zS+Hd1i2aDIgSNS+bLTk35sDQvM8fqn3CzO+qheCN6G
         8GRxnQIC07eOnZ+KjZwOUwO/5t6YsOxtfk/Z3eY6t6ME6VToQ4vv48wZ0R1vpcyENYfN
         iXRpXE09zs4pYpHMWNITVYIzZVgnErcDTSiMFBiB6wTllJif35BIE+CTzwk/wblyeAip
         qkS/g6h/sHIQOupJmIP+Pg8tdsT5rUFN1wx5CYklr4iyRGbIVjh5N4Q+LKOuNmiA5B3Q
         LqLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789780247; x=1790385047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        b=Ku5ZZPbIm91w7kzyXvKcmdkfmlSKPDj+ikn3KeiK/GwOGSBJ9mpq3nBJSMHiNnbYPt
         jyvMl0IoC8odxWRjDmCAXDRycZmZ2CocvDLMlm/tWUGO4AnE8jyB5KrDg5qKVYyPBfiU
         QBncdpuJhP0zSi2lsJUhfKphm6zsyLbw4MEMCOh9wqzNGEACdz+tpekBeMPb75WaHsx7
         8ZZFNBJKwmZUsjroh7HXTWscFxfrrfdphl+Z/Z2WCEDAvozgjb5q/9IcVtadvjAfTykn
         azh900vhnQ2ZhpP9jPgu6C5PG3g0TSRClPqhk0iKVbKXwsuBY9nAOVj6P6+h6SMSUJYa
         vxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789780247; x=1790385047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGdaTY1YJtwZ1uBv2RCa5jny+whMo/kcQ9jtBIf3Fls=;
        b=aq03qSCHx+ydItn3pXJJX+Jq0vSTF7rrAP97NmDdpzhFf2d7c2Fvpa3CWo4CSUJG/6
         KIixi3yJyP178qW9rmHFUQ+onvyavciJFbnMjLrC8zBENHLYQvafIBGSHJqWWf/IALH5
         fO0mZpK1sMW4wSRxNzPsV0m/Po9jFTfN5OVNxCKpWwsW4MDvSTlxE/mZ12gC2llDWiT2
         HoA5Ib6sr60VyTRyks2eoLQoTWWt0ph2FIVaXzlf1OvFFBPy4V8fierMRsnI86leHeC/
         z/ksSJEmvv7Du6hEiEOw6uIdcqML6awLV6itiWxfYcb8cwK0vGIvR65bUcV8KGqTc/7J
         Esow==
X-Forwarded-Encrypted: i=1; AKwUvBwvDhKedoGofprEMxBqb4kI0Fbe3ePUCTrBh8QL9WvF/na6WjfGn57dQRCpAwFFuemZ4cW7+Sz2FmJMuLDHAns=@vger.kernel.org
X-Gm-Message-State: AFuF++kj383A+OuUf37qx6D2IEsMTkgF1JMd9XOevSLYrdxZJ2/EesJn
	9vLRT1rVYnkhpr1TOrlNlitNjxhBlFH46WVxdRZZ+C9csjYj3dAo0bHqGOdAnPAjew+8AfSNpvI
	RuE0mNkB/Iws4g9fFg3e1q2w95jeHadI=
X-Gm-Gg: AYBFou0bEk3Or1jdU3S3ytS9YShafnyYqNvHYDSRQoPfPrmkSYNE3ETT9Vl11sSj66s
	wMLHxv4+aP6zPBBQEklzbEC417luPjdnLBITqieWMEJZRZVHPyLUc4ylNK0gYxuHVBo9JyLy4JX
	r0H2KE/Q+zL/1gxwuPt2yd91F/aIb999BTiuqUH5FPJ2jBB5YYJg6oihxOTVG4Ti3NjRX0P76w/
	/57eX2YAgJPXBgrG//2+hRRL69jNX4dqNIGy+R5V6cnMFna+j/qT/dJCsXpYYu17EcDYbynWEIe
	lNRGC+6WFmsoIHHjELUpnfAg3rFqtYgw3JCxsHKhce2TdCxdfbaR2nAweThjCLpKXMW0AA674GD
	0RkgdZmXmOOwwm+4GK67C4O6B6TC+Cs0j5SYwy8ud2VbhZ96j3In1CsY=
X-Received: by 2002:a05:6512:3e14:b0:5b4:a8c3:d26f with SMTP id
 2adb3069b0e04-5b8c1809b8cmr1360063e87.23.1789780246375; Fri, 18 Sep 2026
 18:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260914014539.5015-5-sigefriedhyy@gmail.com>
 <20260916185405.2ccc6aa3@kernel.org>
In-Reply-To: <20260916185405.2ccc6aa3@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 10:10:36 +0900
X-Gm-Features: AcwNN1V9shfXHkJcE1WXlFxXnTZCibrBttUB3lePMBgN9N4dGzTVVWcdAubNumo
Message-ID: <CA+7S2vJXBAz61SOu+rUt5aqbnsZ-_G_KYt8wXXbqzD0FCSh5eQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast dumps
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:54=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon, 14 Sep 2026 10:45:39 +0900 Yuyang Huang wrote:
> > +        try:
> > +            addresses =3D rtnl.getmulticast(
> > +                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx}=
,
> > +                dump=3DTrue)
> > +        except NlError as e:
> > +            if e.error =3D=3D errno.EOPNOTSUPP:
> > +                raise KsftSkipEx(
> > +                    "kernel does not support AF_PACKET multicast dump"=
)
>
> What's the point of catching this exception?
> The error for ENOPNOTSUPP will be both very rare (not sure I understand
> where you expect it to come from TBH), and also about as meaningful as
> the skip. Just let the exception propagate, it's fine.
>
> Otherwise Pylint complains:
> W0707: Consider explicitly re-raising using 'raise KsftSkipEx('kernel doe=
s not support AF_PACKET multicast dump') from e' (raise-missing-from)
>
>
> > +            raise

Thanks for the review, I will fix it in the next patchset.
