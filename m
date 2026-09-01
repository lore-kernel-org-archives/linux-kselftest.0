Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325744062F
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279609; cv=none; b=mrXT9y6+wrt4Ox0BjoCEtEzPnRCOR819u7LpD2JPx4KVnWNGP6HziEJdMuzBy8V0MSMVYN/MnheOkrToGknRYav0tA9tULl6y6CQjy4RUicpgmrXMq49R3Bw9fLdK0ZLp7pQ66A+xiGAcscicYgej/JMXxtKcmgFyhTMnNlBXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279609; c=relaxed/simple;
	bh=Ph8PvSY4jSqoOfFA76v8Y19/URES1/E/ItNUd86GafU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=axo+S6yV8/GS/CQnWWdzdJg5XeUi92NzZTKJD+9o2F4/vEg7F57pf/Kbr79nvHtjo5SIcAHF1MALCxpImNgMUszXuPZW8xE5BjFbyspVGEd6ve77uS5h6M2fcSsCoP2+jhvc0Dkl+t0wapzCjuii19mqXNpeGlCjetgHhLUCz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UlM36j2H; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UlM36j2H"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c259e5c22ffso409165666b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1788279606; x=1788884406; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xt613ZL56XxGaY2+kHrcKG3IPyUonAahqlih7qZ2NEQ=;
        b=UlM36j2Htpj87uDzTxIa3W42+QqPM0tcZylTckJfK00n1X2/Egsf/2F2epjgMAAeW6
         X7/kkZWbDQ5F2a2B36pPnDknMaUJinACS0bMqtmfu5HU7w9frWjBLb/2M747q3/uPL7I
         9JhTItBv1UPx8CY64Cev/YsJNrWgQBZlvVuLj1/P5G566txlZy2AHgkH02cAxXh7DerV
         dowJzMUMrVPpKsaj/AmiR6AlB/TDhTtWr9IpKM8AtadL6zbbiaSVox1zx8KOgjPwUfX5
         fG7FwzuvZyRfZu+4wIsX5iTGSl3vuRe6kliVC8aMHlDsbQA4j18z8fJtdb48f5K93kzb
         dfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788279606; x=1788884406;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xt613ZL56XxGaY2+kHrcKG3IPyUonAahqlih7qZ2NEQ=;
        b=ZKa4uNT+CWbRgg0zxMJiZs0h2+h+IzfZThQO2XYhnkReAIsV5NgCVLOXzJtpHHm8m9
         5H00nfPTBKlDz6LmwqFgViXQGVtpfoTmUsxa+jrfiQV012N1UX+22ed7ERknc6iFh6P0
         YP2mbcHh0SqZHOwfRHukkcvvV9xt6e2bXAUKNShkrbBCIZUZd5cSsdsWm+sQA9f3Bx5R
         xvOW0QuHNHv+BZw0BMTK3H3/kqzyjaI8kizjFZfdYC3M+284cMORHCdY5QivW5f/6s83
         WdGnDa+2G3H1gWpqISXIt+kcjbhjq4PgpRzfJyXc0ck12cXsztO6dBuCVyKIxm5X/a8g
         6wKg==
X-Forwarded-Encrypted: i=1; AHgh+RqRsa8p4F8FZYiIO/NbM/5c6Ke3CO6cUfDmMrVUmKJK/6TcX6VXKHqFUER959/LZMAOXrJKXz9PakDoMZiR1Fg=@vger.kernel.org
X-Gm-Message-State: AFuF++k8AUozrMgklHVkcTApyDlsJATV+rnsN/EXNwmQx+h4qXOVoUV4
	o09kP7kv/j1HEABysBU1Dk+e+s96FS99UjJqmUy9nxG8VM8ED9uNIy/jzaT6huMC9tm/2lDUX9v
	91G1O6DY=
X-Gm-Gg: AR+sD12Yhv0LbbKlijUQ0ERNY9sfK0PGBiavC0epLV4MTU3JW96ncJVsJeUII0sk1Yt
	RIn+AyriQHrl/1p18lfGaMQ1QkCm3wIaJFnHSRQWX8jna9LytLjkVJ02kPgi9DGoA6V1Q6Qaoe1
	ux0Pgt2FNhuagLfQwB8zJ6Imst5roldjco5Qin2cLBsj14tgoNxcPoIISrnjZ6uKQBPjj+EWFS7
	eVFs0yQbj6f/UwATtvBe6oXXyEMLL4T7IPKG0FEs1MHVFp8hAUx+3qw8RXt+NqUHgGHykl61gVX
	+MQCJIs34j5OpFu6/9LH9Q37AcymQNNDhneeZgXvpUWC2yZC/GQHnU50NPkqRSy+NdjdjYD3UDK
	LF1rAecWzfSQQ/k/h9Q0DXEBb4zj8/mSTVZ1N5bEGdgfD5tdolsXg5ozG6xWUf/5E8WiLWMpoeB
	kA+V77OGmSRi5iG78J2TVvJRJ9duf9VtTNYPw855U9z8bB/z20bli6kDjmyMhaqA==
X-Received: by 2002:a17:907:5c3:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c255741620bmr2353708366b.20.1788279606104;
        Tue, 01 Sep 2026 09:20:06 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249434sm618644366b.55.2026.09.01.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:20:05 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Chris J Arges <carges@cloudflare.com>
Cc: David Ahern <dsahern@kernel.org>,  Ido Schimmel <idosch@nvidia.com>,
  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  kernel-team@cloudflare.com
Subject: Re: [PATCH RFC net-next 1/3] ipv4: hash uncached routes by device
In-Reply-To: <20260826-hash-bucket-route-lists-v1-1-fa9b9f30eb74@cloudflare.com>
	(Chris J. Arges's message of "Wed, 26 Aug 2026 15:20:07 -0500")
References: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
	<20260826-hash-bucket-route-lists-v1-1-fa9b9f30eb74@cloudflare.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Tue, 01 Sep 2026 18:20:04 +0200
Message-ID: <87qzjd2bbf.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 26, 2026 at 03:20 PM -05, Chris J Arges wrote:
> rt_flush_dev() currently walks every per-CPU uncached route list for each
> device being removed. This repeatedly examines unrelated routes and makes
> teardown increasingly expensive as the number of devices grows.
>
> Replace each per-CPU list with 64 hash buckets keyed by the route's
> netdevice. Keep the owning-list pointer in dst_entry so route removal
> remains unchanged, while device teardown only walks the matching bucket on
> each CPU. Hash collisions are filtered by the existing device comparison.
>
> Signed-off-by: Chris J Arges <carges@cloudflare.com>
> ---
>  net/ipv4/route.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 604cc51dfd9b..3f9bc1ec72cc 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -74,6 +74,7 @@
>  #include <linux/init.h>
>  #include <linux/skbuff.h>
>  #include <linux/inetdevice.h>
> +#include <linux/hash.h>
>  #include <linux/igmp.h>
>  #include <linux/pkt_sched.h>
>  #include <linux/mroute.h>
> @@ -1552,11 +1553,22 @@ struct uncached_list {
>  	struct list_head	head;
>  };
>  
> -static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
> +#define RT_UNCACHED_HASH_BITS	6
> +#define RT_UNCACHED_HASH_SIZE	BIT(RT_UNCACHED_HASH_BITS)


Consider making RT[6]_UNCACHED_HASH_BITS a build time tunable.
We've had a case in the past where we had to carry a custom patch [1]
because hash size was hardcoded.

[1] https://lore.kernel.org/netdev/1295041688-16550-1-git-send-email-wsommerfeld@google.com/

> +
> +struct uncached_table {
> +	struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
> +};
> +
> +static DEFINE_PER_CPU_ALIGNED(struct uncached_table, rt_uncached_table);

[...]
