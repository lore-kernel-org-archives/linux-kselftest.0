Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793421655;
	b=3btUHnk9/3oONxPOh3EvywRr0UqRpa+LSyDj0ohstH5d8qGeUlRA2A5Pxgii4BRyXIM8
	 y9Zw+gZvkHV8qAE9qGKg9LSEcKACrK1jdGgj8Ynht9UnCR8S4dhSq1CrW38z2A4M19a9N
	 EsRV6miEV/egZ1ygujPCKL8938oYpwKiMrKtLGHwjZ9JQi3ectrZu1HnROR92Y+FYG4dX
	 pDmk3G1DUwVPMLPp2JTzwq/1GmYfDsh3t49uFjIb/TfsLLrzd6XxF52oJ5Al7HwHtGqDJ
	 Pg4ShzoqWcWqS9Rwy1xteeezqAoibc0RKv5MxyrxsEhgAk1gan/paVYft6F5lzzjg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793421655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
	b=BqUL5u231PzlLqq8XIaGBMWUfDrPWBNvaylFREQLzWHTAMpkOUpV+TFiPsuSWG4uKSx4
	 lYxCEU7vSSFPFGlKf/UgRm5G+i+iYaJkR1ib6QMuqZMJ0FckA714SVyjWC4zdXsZl4/t7
	 oXkuwQl/9tdsiHGnc5ippd3XJyw3mE221IlxDfij187xWBVy5m2OvQCsccIY5uuTEhQAJ
	 ZUgtXn3UW5xoXixdHOWfGh8p/aUZLcgAi2PcXsXHwqzgL/zMY88UpXtZC1a8x6zgGZo1U
	 NkBBmBVkaGZhG4hU5WrTvL8fS9K3X0gyvB6TsDmr9RH39MuC/xthxZn3KZtJihZMJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MuqU8ms;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ACD606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 04:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6ACD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MuqU8ms
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2e987949882so10673775ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793421654; x=1794026454; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=0MuqU8msUuMjk6Fy0H6HY+5EGDhuvjm02aDxiDND72+Qypl4R8QnYelvuub7syhyh2
         asbeLd3dxjqdhkNUSJCYbwtbaw8vocshNkIQKyWCUjWAVTPP3di0gT4c4byR+RqBBJYA
         Jxcv3zPfuBcV27JDiclpuu1Per/oqw3zpat7SLV+6gCrfSkgldx7u+NdOQMBj+M/xQGs
         dQqDotJ6YqGl8D0TSEJGO1fGRX+NMvxrBQON3pYDDuRGIWvukbWnf4CKtmjBr7Ohg7De
         d74OZDQbc0Ij+AWY4CxQJJo+VJ9RoImBJraOGGtO7VWpsQUC24ESVZgRB50Uzyt85P0e
         QDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793421654; x=1794026454;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAG5OYgNALKbmlFXyHbo1nyH/Yr5PiBp4YedVqYig0=;
        b=Mf4QuRlEF1r/F8F0pygXET3ReiS+xpJ+0ykKAFzJAWSQL/QR9k8EoscycDUXI1J7MV
         YJBcJ/mD0DQxwC1Sdbj/F9Qe+EbomUozdU0EzVlAdwqjqjpZas23OuYQuej9O8V5nJpu
         Oh7p6mUFGZMZIqRCzd/EItIUqUCFTmWnTU+t8M0D9a0Ef7LlJOL594hd3Ka4FMTAJrq+
         944NC1wW5zjYM6wOlqpRQn5kpaKFkKR1kji1GuMODSvG+yGrqPzwlYUpKnz8Zxqz3MJi
         sMn6Q4JsTj95HxIcIeUe73KxoyF1u+b2Uvx4dsWbSs0kBjY5eO86hnFSNCXIHgpXecHW
         dkQQ==
X-Forwarded-Encrypted: i=1; AKwUvBygydJbqPFBt6mAtJhIWk1jZe4Pv7u3xNxmDYNeUIk7uFnYmxGf4Jwj5bIN9uj/9OkGhXOmIT4SVGS7kE0Gatc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEhMNr0LzrY6uq/ze+N0xcdakMoOlyP8AdV8F1N7F+govD/WzF
	5arfwjmp44O9BjOfO6YrKjjfmPx3hBHuY3vdtLAzXjYyqAJV8o2+6ZYk
X-Gm-Gg: AYBFou0K8BjLnZRGhVPNQx6O0TzqNcIPFr8pdynvwvvAMpHYXUsdzG74UrhmPD9X3hd
	jo9SHbCrwLFjvy/SoLmk2WxZ2RvwGJMNF3EDI3Nhx+JwNt8o3652U3gzGy7bpuTWFJZdIs3c3jE
	RxMf+h35TSlEuuTzjU8WWitOoWIW6brf2mIfeq157C8VrM2q3pRBgrWgJ4GcJLomeS5MgypDaPa
	df7+n8SVOt4AfMpCzaJcLhOURfBM+uIkKZ1Olm1gZ3VXq8UqXmSiJjc/ufrcE0QWC80SnhiiOZZ
	BzSlyt3duIjcramau91poDlT7jglCCZcd//VvtcJYtEuYj7otIyM88nrb6O/DDk+MZMppOSgWkr
	g0e55WL9Wu59ePz7q9Oo6vK/JCP5XjnkQUQsK6E/0WHGQAHpuYojDod16ldNG3C+YYw9u8earnc
	6uZWzALREieJ4/TnINKaX9hvukzN9Sm9w9GxJdR6O2SpioKtWLeK9yftvAGeF6LGa3kB0TJxM1w
	joYnSwKCT533kfAMJgPM54cI452vbFY65z0+/vZiNCY+rXUJVsjIX2fc2/+ttur+MqDFmpaG++X
	AZVMJUEy0xm7cpoEJqfwo50L3rMo4MINw+vZbNQZlfkiJRt5Wf89vXRBihWsS79GHCwM3wxwXa6
	btTrdUFeOBA9OSkrhPQ7WpTyT1PdGVwBAIM3SBurQyIOgvg8=
X-Received: by 2002:a17:90a:c88c:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3ae8984cf7amr3599348a91.61.1793421654153;
        Fri, 30 Oct 2026 21:40:54 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm6093012a91.4.2026.10.30.21.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:40:53 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sat, 31 Oct 2026 15:36:00 +1100
Message-ID: <179342136087.2.16978105493403840270@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261030044643.157105-1-sj@kernel.org>
References: <20261030044643.157105-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Thu, 29 Oct 2026 21:46:42 -0700 SJ Park wrote:

> Define the value at the beginning of the test.

Makes sense to me.

Thanks,
Aveline Noir
