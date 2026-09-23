Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255C2FE07D
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123835; cv=none; b=sKqyJ9bg2ixOghd8MtuD+twS0/g4tQY2ajwUd3jnQL4deYb/8c9i0joUhBDJBQMD7yQJEoSEELZzIM3VLwCLxaOaYMu/gOv0UBCpFL8fVDWs65S6VwVB0xqhTrf32CGrslcfIOcoRDoN5QovYnEhpXNdwJNpWm5mxO2ahfgG4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123835; c=relaxed/simple;
	bh=oqaPlCUSuLMmmge376HFkC5mCq37bzKmEex5ZULPFT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rb76F+xBn/2s7qFXyJSOQtJREVOsuYXXUB+TO+7eMLXCGWldh/46goAyTuhEiSApy6jsUELY1P+QDbjFkhyTC2ECSIyN4SxeFlv6ciNUV+tUQW0Byziqkgkt47kww9ody19uqUFlnETw5bcIoLgK7G/4jVr2675Ni6U+MDqCl3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHGoCGgE; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHGoCGgE"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so272920b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123833; x=1790728633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cs5VDXaWa10EO+BljqB1eCOQjDMrGLKA7eDZKUXCtZc=;
        b=VHGoCGgEujli+1bSIlAWuKuIN1iEd9b4+DiFFpqvHtHOdVxf/yW22SJApdxQhIlRQ8
         DgXaVOUipfDnRjy1w3lSH01LQ2nmgraOGwErFYz920GVsIoFNmrMUCHiijOjiemu3aHI
         XUPSf2bQJpaqmir5lvatuWNoVTRUI8yDepabVn5GVLiS0KvwQXiOOxmLCs30tRS5qGZi
         bGhtuQEWON/18vyPjCHndfy/gU42rdJkcDBqowXBtUhREAwMw89cEGJ2LJDEaKhRXEom
         2aKh47yvUvT9MzredN0yPpDgYXwxmQaie870QcCHvblrB3PTtBexWeS2UIGN2psLoAFS
         H3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123833; x=1790728633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cs5VDXaWa10EO+BljqB1eCOQjDMrGLKA7eDZKUXCtZc=;
        b=mjK19fi1iUHPJMrTr1w3VrdD4Dw8/GbdgxX51U1lA5r56brwjD3H2YRa+qfm0GD2+K
         1B+MVvVNvWss3B614nZAETm50UfHEF5VJMXPWUzRDPfGNA1x1le7d2+FzYjf+5QUiCYP
         iz23o3n8uoSkym1tR4M1PkHY4sslcM/H2SNdzO1dbauqm5BEqkxP5c/Zk6WQBrZYBm6S
         ceG5GjT78A9EqKL2AZKGj+ztTHf+GNdIgjVpwwEbS64keqFxT8lV/8mYZc1r5/MQAhMg
         HlpfllR2W9+6dHY7xowhsg9gIuM32i6VDFYO/FE94iwkd5APxV8a3BXKejNJL+xcbs/C
         kArg==
X-Forwarded-Encrypted: i=1; AKwUvBx26vj16V5ez9NzJrsnoJo53h6DGkqyJObf3tg6NBx770UkI48+JJZSadOK1mu5my4xoeBjHlCMUPoFguV2nW0=@vger.kernel.org
X-Gm-Message-State: AFuF++lARZvVHRONl33XQaVsH255IVTjBgzndMLcAU9kvLvegN6J6hwm
	PgH69KBcXR0I7O+ggf8kS2GFCJjdhxisSt/rSTjZkVWiy5zLrbwyBF5M
X-Gm-Gg: AYBFou0rfULVOxP50lsQ2hjpvOl8DPRFta7COz14nmdxGzOaQhhq6bCelPP5AVBoXhx
	P53YU6UhseIPHLdf09mkVwIs1dA1EgLwK3NqlHVgXT4qaKyPh9b+AB1MaNK7FjqVqzxxhktw5Jm
	wTSVXIE7MbyrlN3VqieG1Zl/iWkkZ0VYP4yRGRzNShl3KOuAaz4KXOLntU0ELfvb0MyJOsTqqtZ
	CnadplXs2H/qvPfPN8xskSGH6vVmjiIHCIs0D//IoWXR6uTDVfC2U2FRkXB6UODLN6+rTX/isNE
	3qABtyv5AT+bpD8Olp6CjTc17adX2jeXJM25W4nnU2Yi4+gJRNn3fbzUIEgreEMW2OfdcaIyZRS
	oMBG3uzzkBQtXRNzjbMxWqlnG2D71MDpR5jAOb+Hc0u9OQ4OEWykw3UvjrJgw4HufGbNCjmdsHE
	ypgCvtuNZy5lFWNtbGKafw8eNQ8pM6Rs6w6G1B4Uowna9XGLNYFZPmtHteHjEebCaArOJmaEZwx
	JfSeSMD8dKj1jh8Zt2V
X-Received: by 2002:a05:6a00:a489:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-87d19da1c6amr1197615b3a.26.1790123833293;
        Tue, 22 Sep 2026 17:37:13 -0700 (PDT)
Received: from [163.43.103.131] ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dff9778sm427895b3a.49.2026.09.22.17.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:37:12 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Wed, 23 Sep 2026 09:36:58 +0900
Subject: [PATCH net 3/4] net: ip_tunnel: accept tunnel options without
 NLA_F_NESTED
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-lwt-encap-noflag-v1-3-8de7ab6c86e9@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6146;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=oqaPlCUSuLMmmge376HFkC5mCq37bzKmEex5ZULPFT4=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBqsx8qoZ9UvQxTNKyzWBK4DXc+hGQf0Ml3ZHx0p
 +tAt2uuOZuJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCarMfKgAKCRAq19F1Kl0b
 TcjcEACpcfZ9JEJkn4O6lUv8wQ6QicwbBE8oiwLchoHGyxzunTObvQO0XZ/CKYQ3qtFFLOWjCaQ
 joZa3hLwY5PcuD4QqsB+V0i9t+zhVgVqIyRb4pv/MgJvoO/kihCgePgKzY9uCNM2gYMM+ClUxgI
 cNeAT7ee9R1UbuLqe/EnUjIpecZGi/YdHGzA8EEon7K3Rwumb5K1GmJlYAy1A2EGYWriGYQJiWz
 dr1lf4qWLGgsmO8Gi/WCNGgETtkUmYGiGqaEnNqDHIybcKaN5LFC1eorCXXdx8lkSOJGiZze0gU
 /9rNWFSJisqX11KlR5q+C8zEYR2wqtZ+FA+9VWV5QCSkXpSuj3jOOm/vCkjqp1SLhicTHreWo4/
 LpDn6S/H2FhcDJRrV0PGtH0Gb6ft87r1tVyaV/Te1aFwdDFXFM3hp5+OPjaR6Kd6V1ci25eYE8e
 uxh4XoDu+Hqcgcd9l8/9+hZdEDQEHvt2sffMd4W2/mOtrS/4CGyKab/AsNC3HRty8DEAGVwhBPD
 SThiw1a9q66pzbja0gp9Kvo+BsqNJx4pRmlIL1yFZEPxbM3tswQHEUql0t4B+xQTcE96jRCs+Ut
 rdDnd7340H4URrbmtt8sgSw42QY9NP+MyMMSfELOiMyM7dUN/Vf4yrxb8G+cf9ps7dWXAVgZXK6
 uPzH0YDZpLdgXrg==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

ip_tun_fill_encap_opts() and its helpers dump LWTUNNEL_IP_OPTS,
LWTUNNEL_IP6_OPTS and the geneve, vxlan and erspan options nested in
them without NLA_F_NESTED.  Commit ed02551f58b9 ("lwtunnel: change to
use nla_parse_nested on new options") made the parsing of all of them
strict, on the grounds that new attributes should be strict from the
start, but left the dump as it was, and the two sides have disagreed
ever since.  So "ip route restore" cannot send back the ip and ip6
encap routes with tunnel options saved by "ip route save":

  # ip route add 192.0.2.0/24 encap ip id 1 dst 198.51.100.2 \
      geneve_opts 0:0:12121212 dev dummy0
  # ip route save 192.0.2.0/24 > route.bin
  # ip route del 192.0.2.0/24
  # ip route restore < route.bin
  Error: NLA_F_NESTED is missing.

The flag is required at three levels:

  - ip_tun_policy and ip6_tun_policy validate LWTUNNEL_IP_OPTS and
    LWTUNNEL_IP6_OPTS strictly through .strict_start_type.
  - ip_tun_parse_opts() validates the options nested in them with
    nla_validate(), which is strict as well.
  - ip_tun_parse_opts_geneve(), ip_tun_parse_opts_vxlan() and
    ip_tun_parse_opts_erspan() parse each option with
    nla_parse_nested().

Start the strict validation after LWTUNNEL_IP(6)_OPTS, validate the
options with lwtunnel_nla_validate(), which is nla_validate() without
the NLA_F_NESTED check, and parse each option with lwtunnel_nla_parse().
netlink has no validation level that keeps the other strict checks and
drops that one, so lwtunnel_nla_validate() clears the flag when calling
__nla_validate().  Nothing else is relaxed: unknown option types and
trailing bytes after the last option are still rejected, and attributes
added to ip_tun_policy and ip6_tun_policy later are still validated
strictly.

Fixes: ed02551f58b9 ("lwtunnel: change to use nla_parse_nested on new options")
Fixes: 2f1d370b997a ("lwtunnel: add support for multiple geneve opts")
Fixes: 7b6a70f73764 ("lwtunnel: be STRICT to validate the new LWTUNNEL_IP(6)_OPTS")
Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 include/net/lwtunnel.h    | 22 ++++++++++++++++++++++
 net/ipv4/ip_tunnel_core.c | 24 ++++++++++++++----------
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/include/net/lwtunnel.h b/include/net/lwtunnel.h
index 046978d6224c..59d7ec7b04f2 100644
--- a/include/net/lwtunnel.h
+++ b/include/net/lwtunnel.h
@@ -80,6 +80,28 @@ static inline int lwtunnel_nla_parse(struct nlattr *tb[], int maxtype,
 			 extack);
 }
 
+/**
+ * lwtunnel_nla_validate - validate the attributes nested in an lwtunnel encap
+ * @nla: encap attribute passed to &lwtunnel_encap_ops.build_state, or an
+ *	attribute nested in it
+ * @maxtype: maximum attribute type to be expected
+ * @policy: validation policy
+ * @extack: extended ACK report struct
+ *
+ * Like nla_validate(), except that NLA_F_NESTED is not required on the
+ * attributes nested in @nla, for the reason given for lwtunnel_nla_parse().
+ *
+ * Return: 0 on success or a negative error code.
+ */
+static inline int lwtunnel_nla_validate(const struct nlattr *nla, int maxtype,
+					const struct nla_policy *policy,
+					struct netlink_ext_ack *extack)
+{
+	return __nla_validate(nla_data(nla), nla_len(nla), maxtype, policy,
+			      NL_VALIDATE_STRICT & ~NL_VALIDATE_NESTED,
+			      extack);
+}
+
 #ifdef CONFIG_LWTUNNEL
 
 DECLARE_STATIC_KEY_FALSE(nf_hooks_lwtunnel_enabled);
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index bab42b9e277f..c87827ffc347 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -466,7 +466,9 @@ int skb_tunnel_check_pmtu(struct sk_buff *skb, struct dst_entry *encap_dst,
 EXPORT_SYMBOL(skb_tunnel_check_pmtu);
 
 static const struct nla_policy ip_tun_policy[LWTUNNEL_IP_MAX + 1] = {
-	[LWTUNNEL_IP_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP_OPTS },
+	[LWTUNNEL_IP_UNSPEC]	= {
+		.strict_start_type = LWTUNNEL_IP_OPTS + 1
+	},
 	[LWTUNNEL_IP_ID]	= { .type = NLA_U64 },
 	[LWTUNNEL_IP_DST]	= { .type = NLA_U32 },
 	[LWTUNNEL_IP_SRC]	= { .type = NLA_U32 },
@@ -509,8 +511,8 @@ static int ip_tun_parse_opts_geneve(struct nlattr *attr,
 	struct nlattr *tb[LWTUNNEL_IP_OPT_GENEVE_MAX + 1];
 	int data_len, err;
 
-	err = nla_parse_nested(tb, LWTUNNEL_IP_OPT_GENEVE_MAX, attr,
-			       geneve_opt_policy, extack);
+	err = lwtunnel_nla_parse(tb, LWTUNNEL_IP_OPT_GENEVE_MAX, attr,
+				 geneve_opt_policy, extack);
 	if (err)
 		return err;
 
@@ -546,8 +548,8 @@ static int ip_tun_parse_opts_vxlan(struct nlattr *attr,
 	struct nlattr *tb[LWTUNNEL_IP_OPT_VXLAN_MAX + 1];
 	int err;
 
-	err = nla_parse_nested(tb, LWTUNNEL_IP_OPT_VXLAN_MAX, attr,
-			       vxlan_opt_policy, extack);
+	err = lwtunnel_nla_parse(tb, LWTUNNEL_IP_OPT_VXLAN_MAX, attr,
+				 vxlan_opt_policy, extack);
 	if (err)
 		return err;
 
@@ -575,8 +577,8 @@ static int ip_tun_parse_opts_erspan(struct nlattr *attr,
 	int err;
 	u8 ver;
 
-	err = nla_parse_nested(tb, LWTUNNEL_IP_OPT_ERSPAN_MAX, attr,
-			       erspan_opt_policy, extack);
+	err = lwtunnel_nla_parse(tb, LWTUNNEL_IP_OPT_ERSPAN_MAX, attr,
+				 erspan_opt_policy, extack);
 	if (err)
 		return err;
 
@@ -626,8 +628,8 @@ static int ip_tun_parse_opts(struct nlattr *attr, struct ip_tunnel_info *info,
 	if (!attr)
 		return 0;
 
-	err = nla_validate(nla_data(attr), nla_len(attr), LWTUNNEL_IP_OPTS_MAX,
-			   ip_opts_policy, extack);
+	err = lwtunnel_nla_validate(attr, LWTUNNEL_IP_OPTS_MAX,
+				    ip_opts_policy, extack);
 	if (err)
 		return err;
 
@@ -975,7 +977,9 @@ static const struct lwtunnel_encap_ops ip_tun_lwt_ops = {
 };
 
 static const struct nla_policy ip6_tun_policy[LWTUNNEL_IP6_MAX + 1] = {
-	[LWTUNNEL_IP6_UNSPEC]	= { .strict_start_type = LWTUNNEL_IP6_OPTS },
+	[LWTUNNEL_IP6_UNSPEC]	= {
+		.strict_start_type = LWTUNNEL_IP6_OPTS + 1
+	},
 	[LWTUNNEL_IP6_ID]		= { .type = NLA_U64 },
 	[LWTUNNEL_IP6_DST]		= { .len = sizeof(struct in6_addr) },
 	[LWTUNNEL_IP6_SRC]		= { .len = sizeof(struct in6_addr) },

-- 
2.50.1

