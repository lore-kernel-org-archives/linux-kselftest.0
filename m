Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400A0501F33
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632503; cv=none; b=m1TbyN8XK52BLWRwExpkIBCtTNv7aRDd/IVMG3bNqkVni5TlUNUvyKGKUzX+8qwF+EsuOlSVpJo3SWnDVclIXj1uB0A9uGTo9uds2a8OuMp0NWtaih/KyTtoq9nPDX/gOKTtvI/oUr19tl6Ji8K+z4QBaptQQ/Hs3DhhdBjA7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632503; c=relaxed/simple;
	bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7lul0Rc2OLHJB7Hti/1bquq/ZUK3dP5TA64OYbqWN0A/BKsvnW5mm61nlX79j35HvznoHb3k6HQpZDZGtQvYedwCpQq4MRScB+O8NikC0dsOmqT9Jyiu3jaAePZLvmGgwuklK0ImsO+7ABZ89zXTtvEZ13TGA2qTFF54tgX628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=DvUaaZIL; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="DvUaaZIL"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso1335855eaf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790632497; x=1791237297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
        b=DvUaaZILADnwMVKEUX0PgmuY8FmMMzWHVR7VQffs6C2jOX1gdv01eYO8hjq5bmj1I0
         YhrZ7JUU24ePSO4mg0Zut1ABJ7tcrd0DIPH/Kfwlc3VCDRdcJjM+FDpI9m7j/n/H0v/N
         EcYCH7zpN1uaiXnJalWp6Jj4doSd/8uLPGXEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632497; x=1791237297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aBCe9JhpyN4TkjwCmlcQnGVb5cYh2Qy34BAJ5vWWr8=;
        b=aTdsrUN/QmsKSdzp2W7DEeovgeSEPNAIl/+vvlyeanDzn5V3AxGn9t4eb5d8GDKiOy
         x8wEkJW1orEf9FAiFKztRIjoYiWgqdDSIKO1SknGigiftmJwA/ydKcnyIEVDF7M03XnW
         ISCcHzZAInLJV2fCG9KpnoG5eqc703mlh2UjPuyk49Yhbd2StCKgNvRwFLnFMkQm36ui
         z1ZOqPwA46of7ad7TTd9to/PPMqV9uqpMm+pa6FptEZiOShJ7ZgADGzyMCa/bMM15QyI
         OA0kLYZa1DBX20vVLQ4sB1V8AHSzf6CH4xKucXDT0bIpBBKjpqkwaMiwjXzQbJnIu0Pe
         zfkA==
X-Forwarded-Encrypted: i=1; AKwUvBzfXxsPUIReiema65srqgZkBahYYyVIiRowmK933B8dnTR90bHUN+LfTWp97GSiyfL7hi2j1pphmETttXhOdOU=@vger.kernel.org
X-Gm-Message-State: AFuF++n3ckDev+WiNmIzhxu0uLjxI+r9iLWDCoXX8azriDr2HYxGWp6T
	IRkCYm9/+O+Jq9hdCmAfQqD/6/WyjwQnTBU+UQGtQM6HS58rrs5wfLnX5feowBa+1xw=
X-Gm-Gg: AYBFou1p9SN0nPEr9xipH5gQ/AJgZ88YkafR+oPQzDl5zB02kMLq+JtoUl/SNdtTx6F
	PzEe3Ae8DM9q2ZGceUrx6IpE3nH3/uQbFPVVgSlfDVg9emWWZrP7Qmxe3k4zya+2wgW5AFcedub
	SGiczsX6NVWwg6VN0zGvXu15LGlEPBkSfIs4dP7IIy7G58W6uwQ4Nl1ALEf4sUUwOrjCFB1nVj7
	cy4552Kikt0MrZO1h60ygbb9qajGdkYKZox/b9u7CY5XlCNglsprnFG6x5Ywy0a+ONxWfXhKAUS
	RjYhDjf18f2rGnWmu2NZQohzs2Mr+ZuuitkyQ0zseEcXJxNju3sKYw9WM6i6VP5wwRshAmiDgqZ
	FiL4IojdLTpWgMeYCYSVZCJKOO+gkpLb0f2BRx9/Gpu/LwiiAdhLFN6j0/ux9OwZ9VdxtTMm7dX
	huD8mngjVYR6sF4kEJO+KIZ55f1CNu11/FxdRTifgbqucNfjrLY0MOZaqy2rNXvWcRm4bfgxnrk
	7AzGzf3DC+RiEHwarKM6j6iClXY2ktD6I0CBCS5ZnA5qUraFHIRCD0WCi2eO2KXELJlSDgZl6w2
	s6I=
X-Received: by 2002:a05:6820:1798:b0:6d8:3caa:a468 with SMTP id 006d021491bc7-6d83cd96f72mr4817511eaf.77.1790632496519;
        Mon, 28 Sep 2026 14:54:56 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d57ef36b0sm2605923a34.6.2026.09.28.14.54.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 14:54:56 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/2] tcp: preserve RACK tracking across partial undo
Date: Mon, 28 Sep 2026 14:53:04 -0700
Message-ID: <20260928215440.25109-2-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926002520.42955-4-nramaswamy@openai.com>
References: <20260926002520.42955-4-nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Adding the maintainers/lists I missed on the original CC. Sorry for the
omission. The cover letter and both patches are available here:

https://lore.kernel.org/netdev/20260926002520.42955-4-nramaswamy@openai.com/T/
