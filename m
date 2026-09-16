Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AA3368B7
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789520886; cv=none; b=tlo5nI4zed+FCSZ29upsFHUYRU8fpoCG7xdvPhHf7RRHXZvuNiJOatW0MyMichTza4gT08uObmsNCQI/1WTimdW0/sCghz9rxLv7POJcJuJGe55mAKvAPKSaK+h+9E+5UK0xgW9iXvZEtcS+45+PkrYqfnGKYmFYXGiNZNBvEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789520886; c=relaxed/simple;
	bh=atmMXUCCJVT+j6u7gYWsI9eMCNTKjfv32dYzkJZTVVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVygbxxMK/+AwE4pS9LNDU4eeepTfii4zM9sUTuYs4hNpcwVbP9k2vfxZ0shaJ9DiOFE295fqepB/eaFkPDAB7Tvx38yVczOtu2ojNHABLw79WQCLb51reBxD/yijb9PBClPslrw6ARQD9cmWAlRVkgnn0IHxKWKde3ylEcO8Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImcDzZOA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImcDzZOA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so3764015ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 18:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789520884; x=1790125684; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbs73jlWEbTHLi2KYaUQlSC+D6XNcbZaCoATLOY/ueE=;
        b=ImcDzZOAlH6ANtxLnpwvum92fjDL6VWNVunyM9/jMFVYo4oL6HEAWrBLdkvAWrX54E
         PMtb9LthNqgM+sJxl8QI/qmDvmsDk5eWu+lou3/07r0REaxYjql9m6phmiw1kt9eR5Qq
         cHeO2IyAozpg4sLvaOHsSBoR7J1+skP3mfnD4DM3JUumqLrZdYcgoySTiJuaRMbpnfsi
         nKvhMjJf55Wi6rAlj/5iTAL39DnqwLYCeoyp1sIGlMhwnKHIW8uHKxfkdQcdLUU+UjOd
         oVNCMZzgKp9EcscNlFZZwcy30+M3MvQMwqkTTX7gQdQdMRU0wuJNvbMrvwlmXoI3y87K
         BX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520884; x=1790125684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbs73jlWEbTHLi2KYaUQlSC+D6XNcbZaCoATLOY/ueE=;
        b=adKagycdO3FS2aTAECLQhKsdmYiCT+XvRiVt1MJKh9vXrsV3pByM+Wq9WmgxPLPkyy
         kztQU+xRUrb+cnLpWYks2iUfwL0A/9z+17C2mvDGJrld2tWlaLteOzjn4HmNv3wJa2k+
         s3w3y5f3mDeWm0LqmjlnKgsEuvdaNLrsKuhVW//6phYsAWazee9h5IELFT+8hVBGeqTl
         BcVpHiZ2KFb8UG5moyXZl60Oecg9lHIUcuicVV8/t9yiwUr9a7B6vdgmFjMAfu+uLS6C
         rqpuWGP7QCQu514qh4Nhaopskvur0pFipHk/h2xOUCScEnsf3p3CtGs0LVRutJDYBWk4
         s7Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzIrwbgiOPfJOB1n8kEHYq2NF9gSgphj9ADc3jykMvOgru3mn86zwtjj8rWjWicvmuDksnxQry+zaJizqA97cw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/7g9xGnT+0gDo2au+Tjrb11hSoGPqsZb9s4FnSp8uhydXITUE
	crekD8bRZlX3SX2WmsEM6MQD9DM7Orhx4iDlwCKGjZZajgcytTYZWGQP
X-Gm-Gg: AYBFou34tdm+stiD2vmtae2ZEb6me1c/qY8fkG9NfLgZslkSk4MtOY/TQfoTqWqODxC
	dCQpBFwMsyC6AOevOEQBJ/w9g5M2JMS/OOG7Eu2tF6e4OMDU0J6o3Ot+nr/bbT67XLZV/j59RFD
	aOG2CzfNytm87igpe0/yI8pk68OfQOOzGIU+24z4hKIxz6vRM3aCo1CdKdnMouOprZO1i1VNx68
	aUil6nBXXrQr9x5wB9G79rokOKzvKQxmh8eYby9hXtyzJ5+txGdXw6qvOVKM55U339KRDWYc1Hl
	zHaS4mskz2yBs7odM0vWll5ni4ysGgCOueP91lb2fP9Wgn+Rx3rmk6GVqEfFHMJi4nyjj0kpG/X
	VT3PkirK54Mcx1t8fjfmTAXaQ8bLtW7oP+B65E/RPUvo75oJG5NZCoRJT/gUwCdLhdnoVjPuGPb
	dcmAKoFOtLl+cHRVY5hZZVNT3uUssLmAz+ARduXnpBHA8xXok522AwUUWBTWJjcRxxaMxZqNU=
X-Received: by 2002:a17:903:3886:b0:2dd:4168:7bd3 with SMTP id d9443c01a7336-2dd8e40f457mr14196975ad.12.1789520884107;
        Tue, 15 Sep 2026 18:08:04 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:51::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee0cc9sm2864095ad.46.2026.09.15.18.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:08:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:07:16 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: narcisav.kernel@gmail.com, netdev@vger.kernel.org, kuba@kernel.org,
	daniel.zahka@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
	horms@kernel.org, willemb@google.com, petrm@nvidia.com,
	anubhavsinggh@google.com, richardbgobert@gmail.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] selftests: drv-net: add BIG TCP test cases
Message-ID: <aqnrxDIh8/+/8zGn@gmail.com>
References: <20260913052419.77910-1-narcisav.kernel@gmail.com>
 <178936359771.22033.17578992147371005884@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178936359771.22033.17578992147371005884@kernel.org>

On Mon, Sep 14, 2026 at 05:26:37AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1
> 
> - [Medium] The four new `big_tcp_*` variants are yielded by
>   `_gro_variants()` in tools/testing/selftests/drivers/net/gro_lib.py…
> - [Low] The patch changes the failure-tolerance policy in `run_test()`
>   from `test_name.startswith("large_")` to…
> 
The tests can still be run for all 3 variants and the MTU setup is
useful for all modes. The commit seems clear enough.

> Pre-existing issues:
> - [Medium] `check_recv_pkts()` (tools/testing/selftests/net/lib/gro.c)
>   reads `correct_payload[num_pkt]` once per received non-FIN frame with…

This is a valid pre-existing issue. I've sent a separate patch to net
with the fix, according to the guidance on fixes. That patch doesn't
conflict with this one.

> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913052419.77910-1-narcisav.kernel%40gmail.com
