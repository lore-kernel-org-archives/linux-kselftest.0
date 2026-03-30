Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16B39A070
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899570; cv=pass; b=INaxsa1a2g69n7ge7CbhBqrIwW7v63A106bZlOLqSDTIhpuLfcNQcuTYb+rIuthfVULZAlvJ5DeMlbl5g0gl8ChPR3p+oaLwWVSrqR1fVlnmwYBe74ZugQMu6oxz5PNkP61P/rK0Tj2RancjpAoN73QqS33rsl1FeROj0XVJWuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899570; c=relaxed/simple;
	bh=raOnWdkwciR774nemG5W5s7l+qsio7cSR6A3+T7p82Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae3jaII10s3zJjlZOwt3FuzPUZ3MZGxpiERQYoNNEtj0ZjOAF58hfdKnw2WVQzPGcbckblVDsyEXXlMdSQC+nR9IdP8Amz/WQu0+z/aIDasgIMbxnXHhPaDtLWMG9ohbsuUd9YUG0fMlLMswFiEjnIvH/+SWYRevoFoAGNsvnlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM7jqwdh; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM7jqwdh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b941ebe79so3443314a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 12:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774899567; cv=none;
        d=google.com; s=arc-20240605;
        b=V59sIt/lrctPn8UIvNcke7hchAD+kH+mlanJFNUljXrLELdujtJQvF/u4HFq/mbaHG
         yrFOUKUoGZp7SnTM6k0e8ZVpjB8wdUywTYoPd9Q6nAXcT7/IsziTWsS5kdVnmnymul29
         SUB5ruNz/fZAb5X3A7Fkm0URR2dnU6vAS2VnCnckbAKFJ6ta0O5FhO1El6U3bRCSlwTV
         Axd9hUNRTEqj5M3Uphg7x7xmXo26UfHhisrTsiHnvMQDfDtVrA2c/reH2kC6XMJ4KrnK
         mskP77yHyvybDcyisr6++PAyoxmlg6pjEFxviddVRy19SIv61LJsu1aiKcU06PsKM8pm
         wybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKh8L3ukh4XUchWBADzpdMRcZ/muD9vhADkdS5aaBtA=;
        fh=VbtNOnLi961RX0mkQntW7rBbgGmCglV1acnFOsgZ4dQ=;
        b=D+gFEFYPLSQMB01amtWtdoABeEHm9+j91BMJcDikiIbNzCKhwF33VLXri+IYbT9kyj
         yPwKSRaGZufrYVdvyUOdU/9yWbR+I6AtEwjiCaKuZ9wzNbDzulWv816oFuMXi8L09omZ
         BBG9E13vt2AoSB2BGl8Tj77SfHlojNw8e4MnHWw8FERaSTeWgxQvzW0kfYsYFoa9VYJo
         pP7Q4HWu2pHrAc+bi96VtLolid2U+L8eV1r57AIAYmuH/QOEJ/IZHlpSsKNTWNUeHj9p
         0A8tMVS8pIZwaKCo6etkSmbgX1Ugkf91nmW3WbIfXGuJl9ZJgKOSyIX7b4juYfgVlXMP
         yLWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774899567; x=1775504367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKh8L3ukh4XUchWBADzpdMRcZ/muD9vhADkdS5aaBtA=;
        b=gM7jqwdhW2iE88jS5syb5bwmhyo9wNc2USf0BEwwBaNuF4dlYsz8oJo9DXaaoh8KaF
         9ZhkNK3xGPKX5Lpz+t3jPWwRUlU3HvsDo6BidFHzszGw1hiGI3T6bNf80S0sM2PzgeXB
         oADL5LZiq5vjq3JpM5S+jVzmc2jdKi79JP/bjEMZZR4LkaUCaCuPihpVcKD4ZYg4kPRR
         qw3TMJwytaCdFEYylnjNvjckVr+43aSlxbx+uE+56BO1Pw4uMhcdfJo9rOQt3t8AGLfs
         1LoXBtgvT6jFqKlhRhHyt20FdrTFp4vz2F111N96vEWtoYAeiqTvx31wdrK+JBzEPJey
         1nXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899567; x=1775504367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKh8L3ukh4XUchWBADzpdMRcZ/muD9vhADkdS5aaBtA=;
        b=LzSbuOet2of7exnJ90+3ONlmtxQjjPEihG1Wk4dGkAo7N//g8dNPfCQtgr1OGcIGsj
         d2YqUXyB5lUUVm0iXSNS3j80WzSnT85M1aWwm6ZdyHvPkF4whKobkNUrcILV383tUszs
         qv5fDnT0aNkMo33i2U9JelpeKdQ8Y+9qMGmuWe1rxqVYy9mNSM37tMtDewlZdeNbe5G+
         OaX2Znia/lokQl0tvkGms4L22S8tWqlMlmLMsDG3goaJ30viV8HoOx27Z3wdT7Mw/dH6
         dY1/DTMAgnYKM59XeztljhPu9fetES+RXc1sqoME1Z+slHoGhgRcYBa3HwE474BKRCIk
         hxsA==
X-Forwarded-Encrypted: i=1; AJvYcCX6rP+/q6/KSyYbBdF2AJ8G/chlccx/WlTEQ/7Q/FOM8e0h3qkXI2DyPLZ1UlJKIc3InSPrYV0u0ncaeCDwpzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXlNj2HZVkq5iHum4O3g+ZKoHXKBzV1OPExkNh8H+fyIavbNpC
	1kRzS9Tgzq0x6OzbyuC4rUilJwfQDL2H10sUbExVTupwntRINs8tQxGI7yneyzZpjiYpv20lejh
	X68xdlR3RBSciNstXVeJZp7rycOAT+YM=
X-Gm-Gg: ATEYQzzlOroNcAoB8ZiyLmVfeoDtJZHc+dRn57M9vPxwGnFgHCUG6f7ye/JJ7e1AwZ7
	tMxVYbfSHqQG4ciy+8CWJU8b/KcIDpU/XnRM7fwSHYiybnCTGIRTw5baOsWJiYkt4xzzFavsNnz
	mGckRC7huZZDLV894KjzDlz023OD+BhJ5NRNMFjEtVzb8lfwLmfj3OW+rsMfGGg/28raz6MXCvd
	RxQtS6I14wgzA6sUTTfwfK8TEIl0ElJQPWsJ0UDikt7C+iTEMhMft0qliaVTkRWdLTl3NDlAbVs
	m/668mM=
X-Received: by 2002:a17:907:846:b0:b98:4f24:a6d with SMTP id
 a640c23a62f3a-b9b502bfd51mr937477666b.11.1774899567358; Mon, 30 Mar 2026
 12:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org> <20260330191611.16929-1-royujjal@gmail.com>
In-Reply-To: <20260330191611.16929-1-royujjal@gmail.com>
From: Ujjal Roy <royujjal@gmail.com>
Date: Tue, 31 Mar 2026 01:09:15 +0530
X-Gm-Features: AQROBzBPKFrWxeTO63V57MZLR93bpDWq5OJl46BKm3EnyddwLm9W3nhW6ZcH4tU
Message-ID: <CAE2MWkkY3anF0Am4JbCFeFax1dSH2F7AyRUjHJs6S17fKkhU6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/5] net: bridge: mcast: add multicast
 exponential field encoding
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, Andy Roulin <aroulin@nvidia.com>, 
	Yong Wang <yongwang@nvidia.com>, Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:46=E2=80=AFAM Ujjal Roy <royujjal@gmail.com> wro=
te:
>
> Description:
> This series addresses a mismatch in how multicast query
> intervals and response codes are handled across IPv4 (IGMPv3)
> and IPv6 (MLDv2). While decoding logic currently exists,
> the corresponding encoding logic is missing during query
> packet generation. This leads to incorrect intervals being
> transmitted when values exceed their linear thresholds.
>
> The patches introduce a unified floating-point encoding
> approach based on RFC3376 and RFC3810, ensuring that large
> intervals are correctly represented in QQIC and MRC fields
> using the exponent-mantissa format.
>
> Key Changes:
> * ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
>   Removes legacy macros in favor of a cleaner, unified
>   calculation for retrieving intervals from encoded fields,
>   improving code maintainability.
>
> * ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
>   Standardizes MLDv2 terminology by renaming mldv2_mrc()
>   to mldv2_mrd() (Maximum Response Delay) and introducing
>   a new API mldv2_qqi for QQI calculation, improving code
>   readability.
>
> * ipv4: igmp: encode multicast exponential fields
>   Introduces the logic to dynamically calculate the exponent
>   and mantissa using bit-scan (fls). This ensures QQIC and
>   MRC fields (8-bit) are properly encoded when transmitting
>   query packets with intervals that exceed their respective
>   linear threshold value of 128 (for QQI/MRT).
>
> * ipv6: mld: encode multicast exponential fields
>   Applies similar encoding logic for MLDv2. This ensures
>   QQIC (8-bit) and MRC (16-bit) fields are properly encoded
>   when transmitting query packets with intervals that exceed
>   their respective linear thresholds (128 for QQI; 32768
>   for MRD).
>
> Impact:
> These changes ensure that multicast queriers and listeners
> stay synchronized on timing intervals, preventing protocol
> timeouts or premature group membership expiration caused
> by incorrectly formatted packet headers.
>
> v2:
> - Retargeted the series to net-next as suggested
> - Fixed a compilation warning in the MLD rename change
> - Kept reverse xmas tree order in IGMP exponential encoding change
> - Added bridge selftests to validate IGMPv3 Query MRC and QQIC handling
>
> Ujjal Roy (5):
>   ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
>   ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
>   ipv4: igmp: encode multicast exponential fields
>   ipv6: mld: encode multicast exponential fields
>   selftests: net: bridge: add tests for igmpv3 MRC and QQIC validation
>
>  include/linux/igmp.h                          | 158 +++++++++++++++-
>  include/net/mld.h                             | 179 +++++++++++++++++-
>  net/bridge/br_multicast.c                     |  22 +--
>  net/ipv4/igmp.c                               |   6 +-
>  net/ipv6/mcast.c                              |  19 +-
>  .../selftests/net/forwarding/.gitignore       |   2 +
>  .../testing/selftests/net/forwarding/Makefile |  10 +
>  .../selftests/net/forwarding/bridge_igmp.sh   | 109 +++++++++++
>  .../selftests/net/forwarding/mc_decode.c      |  38 ++++
>  .../selftests/net/forwarding/mc_encode.c      |  40 ++++
>  10 files changed, 535 insertions(+), 48 deletions(-)
>  create mode 100644 tools/testing/selftests/net/forwarding/mc_decode.c
>  create mode 100644 tools/testing/selftests/net/forwarding/mc_encode.c
>
>
> base-commit: cf0d9080c6f795bc6be08babbffa29b62c06e9b0
> --
> 2.43.0
>

Forgot to attach test result using bridge_igmp.sh selftest.
First two test cases are added newly v3query_mrc_test and v3query_qqic_test=
.

Without these patches:
tools/testing/selftests/net/forwarding# ./bridge_igmp.sh
TEST: IGMPv3 query: verify MRC (configured=3D160, expected=3D132)       [FA=
IL]
        Bad MRC value in IGMP packet:     Max Resp Time: 51.2 sec (0xa0)
TEST: IGMPv3 query: verify QQIC (configured=3D160, expected=3D132)      [FA=
IL]
        Bad QQIC value in IGMP packet:     QQIC: 160
TEST: IGMPv2 report 239.10.10.10                                    [ OK ]
...

With these patches:
tools/testing/selftests/net/forwarding# ./bridge_igmp.sh
TEST: IGMPv3 query: verify MRC (configured=3D160, expected=3D132)       [ O=
K ]
TEST: IGMPv3 query: verify QQIC (configured=3D160, expected=3D132)      [ O=
K ]
TEST: IGMPv2 report 239.10.10.10                                    [ OK ]
...
