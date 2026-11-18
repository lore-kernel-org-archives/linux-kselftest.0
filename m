Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000344;
	b=SRRO/VHn5SAccUZKzwHkQFymRdKZZ/0YVQNgP9vUfas7egqvpg2rnf2veNj9rQeazaMX
	 fhL6090zSM1qeMOqiUDTCj9rBuPAaLpqgIne7w/1Yt4SAJKqQakzgZ+GJfkiTEs5QJeuY
	 QdoDoeF0R6rWgXENb1isRFpNNQTYk7Wp6si9PQMG0L7cjm3dutcCONp/6FFpAND9Ip8Df
	 S8/1UTbmhQlLdJt6DVhWUVYOtXqhBAZjgQPj0XYR3+S7FxdFBU9hpOk9cAPwNIUYoar/O
	 J327pZ8y/Py/6AKqnnnoDgkaIVdc6v4PxVdZwhzMeKvgjcOO61dq2T69EIuj1xFd87w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
	b=QnojXvl6hBWDc21cHzmd+nLJ6+OHEdvH4xdGZmA7v/tiN5Wh/W/ytbxairxK+ivP0zrC
	 mD8FlU+6/Su+beYdR2roCuMoE4rh8OP6wBeHG30BmfZiJPiotpXmAEsHZ7HXAHQghfC8f
	 cHq6denDJEVsYYpB+H674OwvYAeD8xgasGfDQ/tUw+6vDspFxWnMReDjlTdlA21toIHYR
	 9cHQuU/w58wFtFU7AkIiqz9K7AnaStt71mjJ3A8ygpINf7rAPUVb9OhoLY3SfH5FTh7ms
	 JU8w9svr+I1CeI53S+OXvRarcUfxxlk2A+IG0PnL2JUsJKlMh/i5IPwvlIh0euyEaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn4EEAIe;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52685606A330
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52685606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn4EEAIe
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so2352625eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000343; x=1795605143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
        b=fn4EEAIeEpRx+AnRh0wkedAQ7ceRd9Ww8JOclttNSiiYHTkONMmyWWsQYQ0i1hSI76
         3BIFIuXOvpYWPfmXMMPlO9ZyggeGqvwQVrTvfhR1OJuxEM+5Gua2f3eUV5kShdtoemLO
         kRa1DB6bKUfyS+HeB7lcwSGUMg+6VxmV7TFcelRgzLe006d64bZSuLh0rvmc8A2prAJ0
         YEGgL1SM8EL5pU6rkU7B9ky5N8F8tRZRlvbAqAvLtsPhmy11spnC8mbKcj+ExEWd9Csh
         NRvsIJyROWyyXsYdWRC6wW7k/DF4Py1QgcRovGoHhwhlaBQoOLTTrJRySpOVpHoaUazM
         i4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000343; x=1795605143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=53IUSq9d/hk1iaXQ1eoTJWrnyEolczWzJhhgu4AKlpo=;
        b=tSt2b9eE9G+nRuUgcEXgl0LStAZXZRX9lzBjjiV2Opcg/A8TNTrTi6iXMPwGAAsfry
         IdF5a6P16XdAynNenwgFB0uHmNq1SL19AHj7PW3kLs07YKQ+Wse7HpLSVL0zDi3ttviw
         GMK5Vc7Pl1sV9MP8rok8sG4OxwVqciooU0XhVn6j7sUUnXjCB4nSSpVHIc/vrxnyUSVN
         76sV54q1CAjhmW2C+MQC1DzLXL6HZNh5fczOoma7ayTpbmln+pMU0ibKfZDd9Inbp88R
         F23UCX/ZFogCxXeBgp3ju8eJUHeFJhoM2BafM9FFLt4+9xYWa9GGlUpJdiEEDDKK+pvs
         v7qA==
X-Forwarded-Encrypted: i=1; AL+hErH+juEwZxou6BZctaZVDKxPmWjmNKj7GlXZEcrUNtI1bztKfM+ok7I3YBfdoUHiBLn64YNp3AsqWWW4c/p+7B0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P8mizzQbyEG8kYGP64bzubiRAWgkGhvFg7Q3pYbs+ru1PbVnM
	DLF9EZEAwojqGBv8TZRVCbSwCOVt4NAyyg4CQIdWiJ2N2YXRkhLEzycH
X-Gm-Gg: AZFdTZcTL4dU3giswAQ19BSc+0WqhoXtchMBf/ExyWT/vpOwsIhICArG8FJ8QVdOkWU
	SOhYMoBfY03ydkludMshVeG8At5A6gGyBMrfCO9OAtsV2JhWZsMhpk3TXH4l45ZaeCb3Mm6Bk0J
	KH0dwvTtEC8o5oocjD8TfJOyeC4lE4s34dyQu1USNuHXS5cU7QJj4CQrnyWueK22L6Ts9MVDV3d
	OSNJ0ZQi7Mrgu1Iu0EWAwDTcrE4JKWKM9ajkbhHBw6y7IZfgjbvn/WGuBENSnN+Qsal+YX09kJ+
	5iIs4SU9DIAyyfUJyFSO/PigTN5pa9nsDMluRNrYXeHgwwAOiDhYKQiXi30hoFpjXjSopnEF30C
	lakcSA8N5GbAZ7Z7BlqyGfq5rERPkZJKFxP0GBbxGDI42gqCL8QcgsuWmjEYfEjCRGo8Z6YYZgk
	CM1DB4rE4yWrNK4HRYv5aUQMjXHH/goWj8yeEzUgCLk4XzhBfjA12+6oX2SyUG67YQFcKVZX3KB
	XkpN5eNYKGQFMSVr54v29BKg8ks9m0rgGgOJmcocbdOwDJVWMZCtAyQt6itZx+SJHMw7RmwWT4+
	aYSG5rng/Ee+SlNpgN3UMJk3
X-Received: by 2002:a05:7300:271e:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3827fe755c8mr2374157eec.14.1795000343264;
        Wed, 18 Nov 2026 03:12:23 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm12327831eec.7.2026.11.18.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:12:22 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>,
	netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v5 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Wed, 18 Nov 2026 06:12:05 -0500
Message-ID: <20261118111205.1381184-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <119b21d2-31de-4416-aeed-d1f04ffcfd82@kernel.org>
References: <119b21d2-31de-4416-aeed-d1f04ffcfd82@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Matt,

Both make sense, and I will do both.

I will put a changelog per patch in the notes under --- next time, and
mention the CI error there as context instead of a Reported-by tag. You
reported the hang, not the ordering bug behind it, and the trailer claimed
otherwise.

The CI link was how I found the hang at all, so thanks for that.

No new version for this one, as you said.

Minxi
