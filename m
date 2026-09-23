Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A22F290B
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123831; cv=none; b=OJa04UCGrN50nexSFbRY0BDMiDxEhdp1pkkhCjFtVx32qR5eY/8GKd5iIG1do8g+7o53vzAB3iff4QfZ12+c78FJPYdGt64SqTeFmz1aWy2c/PZ8hQIRTnKgYZ7UhJyh23H8HrTjAQFL7zwlXEY5B7i5I+rKH4qZWU4AT0EmXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123831; c=relaxed/simple;
	bh=EbcJkqAUsR125AsGOm6uKZ0BhA9adZV84zXsqa1i6mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+TQ3adEghKNSt2Rd8O+KS5vIXB0USI98PZNWK4iAA9xaTg2EswjZdjJeg69+gRbkdjj2F7KVXEFr0gdErB8pKpPbNpqLh5Wk0CIBDJSkxVg1dRsutA1p0SnLeNSZqyog891o5eY2yjZnZ1Hm4tNjsEv++CvPkf6S4qxL8FiH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P98Wr6Xi; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P98Wr6Xi"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87c90648f99so374649b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123829; x=1790728629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jWT/lp+R/Tlkfp+3AKgblbjp5barctUrxy33CjiCvo=;
        b=P98Wr6Xie/MCpG4SEXPluyKf33BZ/UVaBzX3WWsy84oHo6F7sHO3KXt0pjSTUwP7xS
         6h9at34tW5lH3Sqg2v2kCFLa+rF/W8qbmMqpt/mXMtmL7iUjHdbzzn4ZZlZCVAYLXvhl
         BYolK6WOgmE7giXKU1IoIFYJROXKdjMNrHzqIpzg4ZRwwa6POWxAUfErRmubTvwS7+Xc
         Eeihwjib7V6iSTwvmipyjiINIoYVrWLg9jr61apECLtMeN5JUlw/ruRC662IS9w885mO
         0y/wko6H7hvfuu0XP+OtK9R7MlT8nFVvkfxAZEETm7Zy+qwpKfRUzusvXzluFJzE3KEt
         rF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123829; x=1790728629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jWT/lp+R/Tlkfp+3AKgblbjp5barctUrxy33CjiCvo=;
        b=tkDVP+h1r4sU1SSBw46tlM+4PJVhzJMiyHNVfjKVMxU8xGj078RLb9CM5o4fuE/npY
         o1JWE78THmC4H5P9UdFVNtmDAZvC6dunlNWqJLsy/Z/79cVf1VBrqK10mzqdJ/PcjeMJ
         TYW9sLJNPd03SO+PCkmtmevgMWTmGz//umhr7eYJyVPA73OPbMzX7UO7Jni/zXpxxbMz
         +iTegpWPLewBKvgxqJ3FQuxQczb/INvRaF5XipfuUI9P3/Qalx9vWvzzZxNYXuhMRaGp
         gU9802Hyx7ZibtOWEYD9AAFPW6HmArHUKXeKhRB2UHq6n2ljt2++6H5V7KLEhr6G3Lmo
         cKtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsYkvet6Z+yWQpH3L7FZpWgidu808waLYEjJTIe5r2kJZf9lUJFznsbuq36xI7UxW8GWt1n7bQUELDhLy6+e4=@vger.kernel.org
X-Gm-Message-State: AFuF++nG+rC8glR19n72YF5Ro4gzfp6XyqE9AJ0qqd8tV5woru8a5h5p
	HR/BsnDzqaZFkq7BRwZclSFcT8bqmH05t5lx/Xtfzkrqxq9Vle1GX09d
X-Gm-Gg: AYBFou28cMfAfwLMk/9gmeXRPlSkaDBx41+6YeeQpHE1k+9UWY+Tv4Pd2DISM5V1oNX
	MqdhPGQ+c7KDkcBrbMNtYanpTF/rGk4f7nzgSx10IfnzZcbwWGVUHwQmYxczgyZsSxc5iLJHS9J
	tsQS8hYb5yiDfGO4HpoqHjNguJfw6zH4l+E2se51IRpLIvHZAT3LX7jU0jg+ZxnWlP2UQNmkYCK
	eQOjzYs2reaJcj45By4OvZYETnnwFzS1QLAF+ICuREa0DshgLiFQFcYmaVCb2ny2YTjPxjVO21t
	pieaLXGW1noqRDT4sN9E/9gYXqjNAmI9xdzW1kwGRnUtvt6aY/7rcSPC+PBrgo7UB2191RMt/4g
	TXyU9o1+/LMXRA/GkwdMaeVQKB4zls4Hd9JoNV4lJaywUSZXOECY7L9SNB1Dn1yCgzfOAGVn3i2
	1SteUGbYFnhVdhI9XGvqYmrkjUhHWN9KZz4Hfwe8uI6q1rkYHWmDZOyw+k66GBB83SdOg7yNfLf
	2nhIYgYXSU=
X-Received: by 2002:a05:6a00:3c86:b0:878:3783:8a8a with SMTP id d2e1a72fcca58-87d1dde2ffamr1087891b3a.54.1790123829429;
        Tue, 22 Sep 2026 17:37:09 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9778sm427895b3a.49.2026.09.22.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:37:08 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 23 Sep 2026 09:36:57 +0900
Subject: [PATCH net 2/4] xfrm: lwtunnel: accept RTA_ENCAP without
 NLA_F_NESTED
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-lwt-encap-noflag-v1-2-8de7ab6c86e9@gmail.com>
References: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
In-Reply-To: <20260923-lwt-encap-noflag-v1-0-8de7ab6c86e9@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Nikolay Aleksandrov <razor@blackwall.org>, 
 Eyal Birger <eyal.birger@gmail.com>, 
 Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
 Xin Long <lucien.xin@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=EbcJkqAUsR125AsGOm6uKZ0BhA9adZV84zXsqa1i6mA=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsx8pbycS0xTOF+rGUkGurYGp4Ki+GssAR/lwC
 wNJEjCLWGGJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarMfKQAKCRAq19F1Kl0b
 Tf7QD/0bfigNdYJ/Eb5oQOcvab12OHdvsLB2IgXftugNDtbYezhZfzSwybDssg+ldzqjhFOOA1P
 pNzC6A0y1wPGFffcMepDjYH+RdH631eA8ce3cbckRsN02ncQBqkhvGSWkjyubId+NI6MQDN9zhK
 ZcE9DEiQDkLeXugF2oxz4qXQ7dlU5cGWd50td4B8DCs4jrttrn12Ipa+IIenHnVA9GJ+97c3po+
 hOmHk0WmDkboteJ+GAXVtq1m7WyOdz5ievXSUs24lQSJ2yHNk14LpdYihIIO+OpqfD9RFc3sfms
 8/g0DswPc4ufeeaBQGcp9ze13NG51lZPnayx/PQa2+PZ6tCQve95Ukz/OAcvpOT199N8LYL9Pb8
 6pDZlzU0ueBHBkxMVtVNZSh/rtcfQmcw5rybotR75+9CqjULhjNumQ5nwrjm/JHrwsOxrP2K5Xe
 +YSvXnr1jhBjtizuoONPUrl/EMXZYxenSgMq9G3lqRiU//B15Iilh0SUFziSHuk9FI7uoP5ZiWr
 F1ASWbOGXHNbgZH8r+CH+AkYvedy89dKtd9jmjDdsfSabt4EH5R50PpqUJ9knlNvMlsgdaGXMJl
 SkIL8pp5Un2Dnrr4bQjWKBwNp5zDnxJAfn0DQKPnbvXyv0n15klTCqli91MaJdALHfnx5rC4KvQ
 I8I5SANjcjWiIRA==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

xfrmi_build_state() parses RTA_ENCAP with nla_parse_nested(), which
requires NLA_F_NESTED, but lwtunnel_fill_encap() dumps RTA_ENCAP
without it.  As a result, "ip route restore" cannot restore the routes
saved by "ip route save":

  # ip -6 route add 2001:db8:3::/64 dev ipsec0 encap xfrm if_id 1
  # ip -6 route save 2001:db8:3::/64 > route.bin
  # ip -6 route del 2001:db8:3::/64
  # ip -6 route restore < route.bin
  Error: NLA_F_NESTED is missing.

Use lwtunnel_nla_parse().

Fixes: 2c2493b9da91 ("xfrm: lwtunnel: add lwtunnel support for xfrm interfaces in collect_md mode")
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/xfrm/xfrm_interface_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 688306bf62c5..2fcfbfac315a 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -80,7 +80,8 @@ static int xfrmi_build_state(struct net *net, struct nlattr *nla,
 	struct xfrm_md_info *info;
 	int ret;
 
-	ret = nla_parse_nested(tb, LWT_XFRM_MAX, nla, xfrm_lwt_policy, extack);
+	ret = lwtunnel_nla_parse(tb, LWT_XFRM_MAX, nla, xfrm_lwt_policy,
+				 extack);
 	if (ret < 0)
 		return ret;
 

-- 
2.50.1

