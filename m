Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D739D6F6
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687181; cv=none; b=FsHCIrmyIz1IcqFc+rjixDxeL1Mw7XyBQd+sDbxAJj8sy07Ezc/joaDkCVcowOfSTIws3Iom4cpt8ElDFlmQzUPBG9vrUn30/3+0p5csMgZssoFskj/w2ykXANMNNYYDRCdGwLT5oidfOymlXjP4GITvexCRPJqkVevikeLwbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687181; c=relaxed/simple;
	bh=69WZuOaA5uDn33icQVKr/RJg3X4tdnNGNXmU1ISAwwQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F08ViCez8lw4hhX9D91qYyTNpG8SC748VT0VK1DqQzB/fuQw+s/W/g8yqxy1eg0+fjCCOJXp9wLip8/zlGVoj6IbrzwcHb8C8E7ihfmY49zSSm+HF3/K/i1e9R0ltbb6XyyBbou3CL+hyD0bagcEr1nP/J4SomsTp0CREXGMXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCeul5BK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=omYqJm3Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCeul5BK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="omYqJm3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781687179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69WZuOaA5uDn33icQVKr/RJg3X4tdnNGNXmU1ISAwwQ=;
	b=TCeul5BKjlp8XAOdMPwAz9lrX/X+cmsSFxdLtV7k+0oqG4CHoxmD1/fpGSzC+NEfleECO1
	0p2MILKXQx/DWef+N4hmwbZrMB1ebsk0JY+1gj5raQ33fxpx+vcfL95z6ZDwfh0XG4yJcj
	mL3P35MrZmZDj4SfqbPSrMLMFgEa8TM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-21qsMZbyMRGcL9rIyIwj2g-1; Wed, 17 Jun 2026 05:06:18 -0400
X-MC-Unique: 21qsMZbyMRGcL9rIyIwj2g-1
X-Mimecast-MFC-AGG-ID: 21qsMZbyMRGcL9rIyIwj2g_1781687177
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-461da6328c9so507771f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781687177; x=1782291977; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=69WZuOaA5uDn33icQVKr/RJg3X4tdnNGNXmU1ISAwwQ=;
        b=omYqJm3Y3d6sWHBMiio2UhE6hR1M2vcnpPoyqpdzBMMUK/HhpAOXO2mkZuuvm1CRwl
         SQfepF6GNbq5DYWL/KhAkwFxPZjq5R1XihXhaj5b9VWGKkp4TSbn/P/BXZTrUY+/kmKH
         SHzNBJxhaZAx8IIM6fEf6YO5avjOdciZZg2Jbufsh6Sx96+fgb/GcOWwr+jIw72g2Zui
         aW4QPonVLtl6OwSNLkBbnyHcbeedAb9mR/TpFZVYGgpSZatpqHMCKG3vGeO5YjBTDFLw
         cpE4R0zjjVXwgrNtVeABo2fFgv15Bd7uvYM5S6lRpbD0iPFQUMCEOJRYD3ltS+uQ30G/
         +sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781687177; x=1782291977;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69WZuOaA5uDn33icQVKr/RJg3X4tdnNGNXmU1ISAwwQ=;
        b=q75BHRBibhgCst6tywk7vIHUsw83mfDalDyV4k9BtW5ACrffonFfgzmYbBHHKSVli5
         6xXIi1PBxM9YsNrP99zoQmxBYREwLpf4L+80BzhZbxs19/H3h3Ne/YpYgw5oL4VbZTyI
         h2Y1oM+qv04W+bUnQENNbU8ulOkfP7xYyh9VZOB62smQzkPm5y1XR1kXMtqGkKMm5zzN
         3z8hP4ZsirzPhhPYz30+yPg7LZK8vwvtRyaTlmu6F+3UrDghVgmbyl2KJ3N4xh61kv2J
         nsTKr/A7bMi+lyO5s5t3YVfDionaYhze+Lg8KSdH+bO+UTNOLmU5E8oENEHuypimk4ek
         mGOw==
X-Forwarded-Encrypted: i=1; AFNElJ8dxzxAg1ZQ+oQudtGFAVA1G+Wmv3kEWYAEq7H8ZO8ew3CXj0/qWt8T+szgN9+fp50oGB84P73UWjVJ59yhS2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTq79ywSl93Fh+5QW92w8YBH/OzyS1wD5Db5rgGGYdrwHRpAh
	8Sh6ISbifOju1xdYgrIMZ4+TxseV4PLafiPzu9VoV6TAsTGkDliJcQbWUzlBOO3srf5WrrJCw57
	60IcnpQ4ZpWeNI4Sp+8WkdiSfNGiqjcRn7SiM6ihmfIjxCox5iZpK3Y6G9dBrht2I14CQ8A==
X-Gm-Gg: AfdE7cmPOHHsNx92yOOSHckIgc6jMSfNeXn2STIBJKGcZJIarenBXH8EuXa9JHnJVQI
	UNaVLfSWLZQwETrRg6F2IDJxcy8XFdGEkLx+SINxgTj+PnSjWnI+tgXBraMdpcbNukKAiM6cO/t
	masEl6RY20EuAPTbXHUfTlClpsrU+VaBzXibWkoTbzsfoEah1f3M9Q2j2rnyVIeAv1hHO0OHy16
	ov6fEcmO7mMNJ6+zmZWoV/+ByMkltTUTMVmf7nJrB0yiQiikPpxziH2CnK6gJbdZnGc4f+C0Ny3
	SwNk/CzD9riQHy5/ChGU7chOOONmaY88rsMHv3p4qCtemnLW1kqaRqrmG6A2ZNypUQZwdUv/fDH
	zNzrBYnYDrXNcJoAqa63+uVT/GDp1GV1WyTs=
X-Received: by 2002:a05:6000:603:b0:463:1d06:ab33 with SMTP id ffacd0b85a97d-4631d06ab96mr684826f8f.27.1781687176633;
        Wed, 17 Jun 2026 02:06:16 -0700 (PDT)
X-Received: by 2002:a05:6000:603:b0:463:1d06:ab33 with SMTP id ffacd0b85a97d-4631d06ab96mr684756f8f.27.1781687176152;
        Wed, 17 Jun 2026 02:06:16 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462a9784497sm3816334f8f.34.2026.06.17.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:06:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9B8D88074B0; Wed, 17 Jun 2026 11:06:14 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Avinash Duduskar <avinash.duduskar@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, Mykyta
 Yatsenko <yatsenko@meta.com>, Leon Hwang <leon.hwang@linux.dev>, KP Singh
 <kpsingh@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, Amery
 Hung <ameryhung@gmail.com>, Eyal Birger <eyal.birger@gmail.com>, Rong Tao
 <rongtao@cestc.cn>, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/4] bpf: Initialize the l3mdev field for
 the fib lookup flow
In-Reply-To: <20260616223426.3568080-2-avinash.duduskar@gmail.com>
References: <20260616223426.3568080-1-avinash.duduskar@gmail.com>
 <20260616223426.3568080-2-avinash.duduskar@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 17 Jun 2026 11:06:14 +0200
Message-ID: <87bjd9h6yh.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

> The helper already initializes the other flow fields the rules path
> consumes (flowi4_mark, flowi4_tun_key.tun_id, flowi4_uid and the v6
> counterparts); flowi*_l3mdev was added to that set afterwards and this
> helper was never updated to match. ip_route_input_slow() likewise zeroes
> the field before its input lookup. Do the same here.

So how about we explicitly zero-init the whole struct instead of adding
more fields ad-hoc like this? Otherwise this seems like something that
is likely to happen again if we ever add another field to the struct?

-Toke

