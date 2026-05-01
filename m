Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A47282F09
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777625790; cv=none; b=GYvx5ZcolIZ35/INvsqc35V1j/WBZe0k8+vKNC7XtFZATNKEni2aWWt3Sxl0UZ8QT4us/ZELNh4nqw8dDrFLQU+ESRoDAf4U6+0KZvm/isEeZxbtFCxVe0v5XvE5uZQAjii7HLGMrD/G5ZBNjUWtYoqaC8Ppdmc5+RHovjXcP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777625790; c=relaxed/simple;
	bh=VcdTqccw8iCYV5aU2Evk0F5GIMuBCHLxE9epO6wT83c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRgnt0Cw3QToV0ZpwnfBWg09t8vOk9s84WDtvg9JRpX9EQYO+yL1bml40Ls7QAE8ii5zLQHpcbYfr67Y0mS0/fDRFWDBwuQ6h4vQkb/KCrVwffndZAOK4rMtqaB4FbBy/NQf2HJMLg8P/oQJsCa05MTfWhgYU/8MGqTjwzioZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hrqd3LyH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rp8P3B9c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hrqd3LyH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rp8P3B9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777625787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4FupXqdJDjM6lgFsqsbLspMhnAKLydPwExSEuFrajh8=;
	b=Hrqd3LyHxvtltFvFu8CymMnt9QGc8/u8KXP5qISvlp94yLDLFOS/7A2EDWrDHX6j4sjAA+
	f2bloEonr1vpcd/yYETf9f7iBtphYzHB2Wtc4n58SRTT+cSVOWZETzbJDGDN98yeOamC68
	QBvAS9C8Npeb9r8vwGZRTK3dlbokTR0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-kuvqk56WPGatMmfP8BSyNA-1; Fri, 01 May 2026 04:56:26 -0400
X-MC-Unique: kuvqk56WPGatMmfP8BSyNA-1
X-Mimecast-MFC-AGG-ID: kuvqk56WPGatMmfP8BSyNA_1777625785
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-67b6c936989so1362886a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 01:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777625785; x=1778230585; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FupXqdJDjM6lgFsqsbLspMhnAKLydPwExSEuFrajh8=;
        b=Rp8P3B9cmHsrwQr6LwznSsrvFRVnK4noA3C6FMJpbKYUkDVvnanYyJzJ6wJofR3Rv+
         XgjvNmY00whtnIJ4NjnUIFW42FLoM8BafFP/v7zh4Vl/bEMq4cWJlqI2y5PVMOcRevHj
         WNfURkPbCgVnTpgCGoVJ0OHFkW0nkLWiRJoS9t4IB6UYdbJNosMXxXpcpkNJ/N9U/p1W
         jvA97uQoxSkkeCe2pMySdaPJesGFYnHufiIB7uNWmM3r82K5dObR1VYe3f+uR3FnXvmW
         ym6/Z5ekbO+b9aqQPG5M2JJIjm7Bd7X9UK763pybmOHRTo1sxC/4FpYhmzg0SYfOp2zV
         TkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777625785; x=1778230585;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FupXqdJDjM6lgFsqsbLspMhnAKLydPwExSEuFrajh8=;
        b=PdDDxVNUSjHDURCZgRzOk8BjBYVH+TM1JsvJ4sjd6g/iT6J4kbvN39rRBQA6/aR333
         T/QBT4khmLqHhlkR4EP4VeXRP3lb3N8oI4s0TvnpJdCbzV8VOFdRmbL15/RW7HzjoPGm
         3/7eFFOKRK0wiAiVBafTvCftkt3TNQW3vOyddiM9ppM0zpoZNjd1qDJ8lluIJife6JUu
         STsMhgB5zHCoqw7LLuGBauUwD4knL29mLQOSFUvRnlpKdVJ6DydcuR8cvgMMIYDBDbnG
         Jve6MQ70OPHWS98lhphfCl+UB2klKIA5a/KsjSdW/S+/vM5ttmmiM+cUhqm9TB7bVzAz
         lR2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7z94GLkqLo2R2uzxHlXPkSlVhIOifG5Hg3Hpn+8mp4mn485tyI5vldC88kEyUSWX5XE/cWdyY+EtZWFxJZm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGU80CxoInEL1d/T/zs0c6+ZBkDLE2MS/D7dxjsb7Mr2BZ1qO/
	hLp46jXF/DWS6xRfQgSCCIaRp5bfCyzGcSBG2s8/9fWWoRiZgvDCDO3uUnZwFthFoy6pk76xqLL
	swVa8h5bdp5I4PkUU+fRJr3jfF6yV9mfJ3mkH88cWohprlbJCEw6Ri1X6N3u2Kj+4nOIa4w==
X-Gm-Gg: AeBDievsPGESFowATrtx0vavd5zpQ4gAk9teWvw+VVipiwgpbpztVmodck02eLZFbyy
	vRchkm8CTcsdg0WpAAUBlfterY6UfUjDpKs/PCv5Arz9WQNRoHA2AaDtHK1G3P1hJlVa64l2CMV
	nyRu5ot+UxVhjPJs7Lo5aerB+Ov8XDCFuWEtuIZOiuHpTI19Vh/0R3WZ/7rzMmevIGeXdOguE7d
	aB92RFnzo6NuPpKLDyZmcQr49qHe5FVEQkVvWcgs6UeLFNUdNAuvwY9EDSLkEoM5RqfTNyKmPRO
	DHVT5dpSdymICMXDYonZCAuZLpFNJLBf9SdhKcFjjq6C7PBS17sMEoRC1sxh+bpwfGPEA6pChCD
	gZBDAA5CQQFECWFG2jhw3pkAosIgPPQwQdx7eF7ssBwUBkTCDN3+FploJbX1xwl/N9BLo2LW/Pa
	N6IzNrqA==
X-Received: by 2002:a17:906:5192:20b0:bab:d8e9:53a7 with SMTP id a640c23a62f3a-bbac6cbea67mr326061866b.29.1777625784874;
        Fri, 01 May 2026 01:56:24 -0700 (PDT)
X-Received: by 2002:a17:906:5192:20b0:bab:d8e9:53a7 with SMTP id a640c23a62f3a-bbac6cbea67mr326058966b.29.1777625784314;
        Fri, 01 May 2026 01:56:24 -0700 (PDT)
Received: from [10.44.33.143] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6d84dsm85387066b.2.2026.05.01.01.56.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2026 01:56:23 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Yuan Tan <tanyuan98@outlook.com>, Yang Yang <n05ec@lzu.edu.cn>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: openvswitch: add tests for tunnel
 vport refcounting
Date: Fri, 01 May 2026 10:56:22 +0200
X-Mailer: MailMate (2.0r6292)
Message-ID: <89F36D27-11BD-46A1-8C1B-7A1B89B35C27@redhat.com>
In-Reply-To: <20260430233848.440994-3-i.maximets@ovn.org>
References: <20260430233848.440994-1-i.maximets@ovn.org>
 <20260430233848.440994-3-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 1 May 2026, at 1:38, Ilya Maximets wrote:

> There were a few issues found with the tunnel vport types around the
> vport destruction code.  Add some basic tests, so at least we know that
> they can be properly added and removed without obvious issues.
>
> The test creates OVS datapath, adds a non-LWT tunnel port, makes sure
> they are created, and then removes the datapath and waits for all the
> ports to be gone.
>
> The dpctl script had a few bugs in the none-lwt tunnel creation code,
> so fixing them as well to make the testing possible:
> - The type of the --lwt option changed in order to properly disable it.
> - Removed byte order conversion for the port numbers, as the value
>   supposed to be in the host order.
> - Added missing 'gre' choice for the tunnel type.
>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Changes on the v2 look good to me!

Acked-by: Eelco Chaudron <echaudro@redhat.com>

