Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBB2DC787
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370434; cv=none; b=RhBVdZTfKUSE8bpV+YHc2MoVMPYjisU5oPPvFbMvNjvW9YrjYfroSRW5EKWD5LvLcmru8GzAkj67ySbSlfrLhJ7eCj4c4cXMBxtoBAmVpW7biM7NAt48WNThwyD5n/Y//3aO0X5EfK4zNe+X8yB4olfBDKXTreycPi3YWZ60Y0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370434; c=relaxed/simple;
	bh=c+GiUJQTfwJdt0D4FrdPca+NjRLul/+/cXZFtg415KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ton5X7dFQYTEPj9nev9vehIgHW+NS32qgKDLOOxtv0iN+CipRZiRamPfXL5/Rsd8MwT73Mv+UGsLl+fUJ28LHQVuGeBJI2YcRZ9pQjxTVSkIDijoqUYDGtZvipjkcRN3/RIXryU2jyRLv1Tfs2+I/OY/3zW7YKBcNye2FWbNUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=T8s0Lqb1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="T8s0Lqb1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so4256385e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370432; x=1770975232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=56MUvuCz4kq0jyDggo6mUeNBZRMTvfCb+XKL3S/XDRU=;
        b=T8s0Lqb1oNsUcQFpml28rmErHuUAn+On6w1dppEGr3pDG5G77o0Py0FeS+MxpyxCyq
         z5LV1817Pp5NU1nhAEAtGRYvHoFhzixOPIKBwwBxR1Pl8YOw843zYsa+HHYK8UYTXnkj
         0xHMeujCLFcT69ent5dSbj+ajtJ1Lb2C+0KjKJvikQq5VsW2i2mKqgVMBJ4ukMwRd5Jg
         Y9qNKTAwX/ExTtrun8sEd7m5mB0sN7sbEDTno4CD/PqbGD8AHMUABwgM7Z3HcGlEGOc4
         WC91wj+W2kveJQMWR5BT7sljjvvGZfgJwgV1BtI00WRNaW4MfDjFVYkmu0WUgpw6PTpy
         4vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370432; x=1770975232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56MUvuCz4kq0jyDggo6mUeNBZRMTvfCb+XKL3S/XDRU=;
        b=El5c6bla4qnFoO5CL+XaizzbxRjV5xFApAy2qYMb6s3aKqm5Ftfcy+gfyjJDppusGy
         DrOIgyHxcMbVFy3lNY050hReOEKaUR94oHmvSaf7LjtlTQX5cJlfyXEtSm4+qpdAOkHG
         2LxPCPmZrjW4xdygYYOhqnGJbQVUNCDiHU9xTPvimTpLGRaMxYQjdFWcscgNxJhp1+MN
         bTiMVEFu8fc1YtcqChYwOGmLfuLUwtOkamlMRNRbr/uge+xcn0t8sbbgan5Q27EgPL3b
         1XWi3uSFUilbcrtVpl3fEfpvbMBsB2tZGrL5hWQGM1EAMDOTlcPx189woNPaixAhzT5f
         Nyww==
X-Forwarded-Encrypted: i=1; AJvYcCUzCIbIlijtEqa9H8BYNUDZK3TUimmBBQvf5KV1dnOw5Xmn3nPur3bZCkuxop4eX4OKE7QgPhWfPkCDpAKo2XA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaeRHHs4zGRu8/CIDOEVy5sqpu7IyxhuA3KjvLsIcGT8jcpTRX
	n168V1poYxvTo/lqQDPg1tiG1BLUyjEYTmOjI7NIq4Wmmf4uBV2Ke52WfoZHZWhFacGqG4NjAIX
	JRhyd
X-Gm-Gg: AZuq6aLtwid3fC8NJ+geavdJLfl7fp63LtUyaLjIXrUgOaGaC6YXkWd4nsDknEr+iBO
	1LsClSp+6kmB8AXREa4SOuOOxkB03Y0qfW0Ofm7LvEvsxyMkkVpCgYjJ3+OLM2fA49URrCoK7Mx
	C5FqXSJvnmb5VAX7kUGtqgnai67ROl8vYVTEb3lBmpWusnJMTNbdiwajBBUYoVbLBcTcHkEDlXr
	mmppVdeKtlyOpqMxcPxW8iUmIsTZ3Ron4yEsx3YemZbERNjxKo9RIri6nLLZ8XBhsagmLdk2gGc
	hL4Etf5acKagOzX9bB8m3TyM2L9XSWbTMdMJ+nBFe9/XhxHrn1kSrfbsLLVRG1J6ypm7bS3pRID
	UsBbnmiEsRU/aa/zDuCaWDDUS1sdhZQPS+z/P98S1ELxxix6Ed+5yIWAT4zlfuCHC4OK9EXj4yf
	N5xCcS5O4n+f7C3URvZ7c=
X-Received: by 2002:a05:600c:528a:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-4832021cd67mr28793385e9.26.1770370432345;
        Fri, 06 Feb 2026 01:33:52 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e5b63sm26740685e9.1.2026.02.06.01.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:33:51 -0800 (PST)
Date: Fri, 6 Feb 2026 10:33:50 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 3/7] devlink: Add port resource netlink
 command
Message-ID: <d2a44w5lausinhwqagu332nkuxqmdrfjlrvt2piscd5cg3zjgf@jefnbqja5xbh>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-4-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:29PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add support for userspace to query resources registered on devlink
>ports, allowing drivers to expose per-port resource limits and usage.
>
>Example output:
>
>  $ devlink port resource show
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>  pci/0000:03:00.1/262144:
>    name max_SFs size 20 unit entry
>
>  $ devlink port resource show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> Documentation/netlink/specs/devlink.yaml |  23 ++++++
> include/uapi/linux/devlink.h             |   3 +
> net/devlink/netlink.c                    |   2 +-
> net/devlink/netlink_gen.c                |  32 ++++++-
> net/devlink/netlink_gen.h                |   6 +-
> net/devlink/resource.c                   | 101 +++++++++++++++++++++++
> 6 files changed, 164 insertions(+), 3 deletions(-)
>
>diff --git a/Documentation/netlink/specs/devlink.yaml b/Documentation/netlink/specs/devlink.yaml
>index 837112da6738..0290db1b8393 100644
>--- a/Documentation/netlink/specs/devlink.yaml
>+++ b/Documentation/netlink/specs/devlink.yaml
>@@ -2336,3 +2336,26 @@ operations:
>             - bus-name
>             - dev-name
>             - port-index
>+
>+    -
>+      name: port-resource-get
>+      doc: Get port resources.
>+      attribute-set: devlink
>+      dont-validate: [strict]
>+      do:
>+        pre: devlink-nl-pre-doit-port
>+        post: devlink-nl-post-doit
>+        request:
>+          value: 85
>+          attributes: *port-id-attrs
>+        reply: &port-resource-get-reply
>+          value: 85
>+          attributes:
>+            - bus-name
>+            - dev-name
>+            - port-index
>+            - resource-list
>+      dump:
>+        request:
>+          attributes: *dev-id-attrs
>+        reply: *port-resource-get-reply
>diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
>index e7d6b6d13470..1cabd1f6cba0 100644
>--- a/include/uapi/linux/devlink.h
>+++ b/include/uapi/linux/devlink.h
>@@ -141,6 +141,9 @@ enum devlink_command {
> 
> 	DEVLINK_CMD_NOTIFY_FILTER_SET,
> 
>+	DEVLINK_CMD_PORT_RESOURCE_GET,	/* can dump */
>+	DEVLINK_CMD_PORT_RESOURCE_SET,
>+
> 	/* add new commands above here */
> 	__DEVLINK_CMD_MAX,
> 	DEVLINK_CMD_MAX = __DEVLINK_CMD_MAX - 1
>diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
>index 593605c1b1ef..c78c31779622 100644
>--- a/net/devlink/netlink.c
>+++ b/net/devlink/netlink.c
>@@ -367,7 +367,7 @@ struct genl_family devlink_nl_family __ro_after_init = {
> 	.module		= THIS_MODULE,
> 	.split_ops	= devlink_nl_ops,
> 	.n_split_ops	= ARRAY_SIZE(devlink_nl_ops),
>-	.resv_start_op	= DEVLINK_CMD_SELFTESTS_RUN + 1,
>+	.resv_start_op	= DEVLINK_CMD_PORT_RESOURCE_GET + 1,
> 	.mcgrps		= devlink_nl_mcgrps,
> 	.n_mcgrps	= ARRAY_SIZE(devlink_nl_mcgrps),
> 	.sock_priv_size		= sizeof(struct devlink_nl_sock_priv),
>diff --git a/net/devlink/netlink_gen.c b/net/devlink/netlink_gen.c
>index f4c61c2b4f22..692d7862183a 100644
>--- a/net/devlink/netlink_gen.c
>+++ b/net/devlink/netlink_gen.c
>@@ -604,8 +604,21 @@ static const struct nla_policy devlink_notify_filter_set_nl_policy[DEVLINK_ATTR_
> 	[DEVLINK_ATTR_PORT_INDEX] = { .type = NLA_U32, },
> };
> 
>+/* DEVLINK_CMD_PORT_RESOURCE_GET - do */
>+static const struct nla_policy devlink_port_resource_get_do_nl_policy[DEVLINK_ATTR_PORT_INDEX + 1] = {
>+	[DEVLINK_ATTR_BUS_NAME] = { .type = NLA_NUL_STRING, },
>+	[DEVLINK_ATTR_DEV_NAME] = { .type = NLA_NUL_STRING, },
>+	[DEVLINK_ATTR_PORT_INDEX] = { .type = NLA_U32, },
>+};
>+
>+/* DEVLINK_CMD_PORT_RESOURCE_GET - dump */
>+static const struct nla_policy devlink_port_resource_get_dump_nl_policy[DEVLINK_ATTR_DEV_NAME + 1] = {
>+	[DEVLINK_ATTR_BUS_NAME] = { .type = NLA_NUL_STRING, },
>+	[DEVLINK_ATTR_DEV_NAME] = { .type = NLA_NUL_STRING, },
>+};
>+
> /* Ops table for devlink */
>-const struct genl_split_ops devlink_nl_ops[74] = {
>+const struct genl_split_ops devlink_nl_ops[76] = {
> 	{
> 		.cmd		= DEVLINK_CMD_GET,
> 		.validate	= GENL_DONT_VALIDATE_STRICT,
>@@ -1284,4 +1297,21 @@ const struct genl_split_ops devlink_nl_ops[74] = {
> 		.maxattr	= DEVLINK_ATTR_PORT_INDEX,
> 		.flags		= GENL_CMD_CAP_DO,
> 	},
>+	{
>+		.cmd		= DEVLINK_CMD_PORT_RESOURCE_GET,
>+		.validate	= GENL_DONT_VALIDATE_STRICT,
>+		.pre_doit	= devlink_nl_pre_doit_port,
>+		.doit		= devlink_nl_port_resource_get_doit,
>+		.post_doit	= devlink_nl_post_doit,
>+		.policy		= devlink_port_resource_get_do_nl_policy,
>+		.maxattr	= DEVLINK_ATTR_PORT_INDEX,
>+		.flags		= GENL_CMD_CAP_DO,
>+	},
>+	{
>+		.cmd		= DEVLINK_CMD_PORT_RESOURCE_GET,
>+		.dumpit		= devlink_nl_port_resource_get_dumpit,
>+		.policy		= devlink_port_resource_get_dump_nl_policy,
>+		.maxattr	= DEVLINK_ATTR_DEV_NAME,
>+		.flags		= GENL_CMD_CAP_DUMP,
>+	},
> };
>diff --git a/net/devlink/netlink_gen.h b/net/devlink/netlink_gen.h
>index 2817d53a0eba..204a665d2fd2 100644
>--- a/net/devlink/netlink_gen.h
>+++ b/net/devlink/netlink_gen.h
>@@ -18,7 +18,7 @@ extern const struct nla_policy devlink_dl_rate_tc_bws_nl_policy[DEVLINK_RATE_TC_
> extern const struct nla_policy devlink_dl_selftest_id_nl_policy[DEVLINK_ATTR_SELFTEST_ID_FLASH + 1];
> 
> /* Ops table for devlink */
>-extern const struct genl_split_ops devlink_nl_ops[74];
>+extern const struct genl_split_ops devlink_nl_ops[76];
> 
> int devlink_nl_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
> 			struct genl_info *info);
>@@ -146,5 +146,9 @@ int devlink_nl_selftests_get_dumpit(struct sk_buff *skb,
> int devlink_nl_selftests_run_doit(struct sk_buff *skb, struct genl_info *info);
> int devlink_nl_notify_filter_set_doit(struct sk_buff *skb,
> 				      struct genl_info *info);
>+int devlink_nl_port_resource_get_doit(struct sk_buff *skb,
>+				      struct genl_info *info);
>+int devlink_nl_port_resource_get_dumpit(struct sk_buff *skb,
>+					struct netlink_callback *cb);
> 
> #endif /* _LINUX_DEVLINK_GEN_H */
>diff --git a/net/devlink/resource.c b/net/devlink/resource.c
>index 1b06a1f408fa..42ad7c96a740 100644
>--- a/net/devlink/resource.c
>+++ b/net/devlink/resource.c
>@@ -227,6 +227,7 @@ static int devlink_resource_fill(struct genl_info *info,
> 				 struct list_head *resource_list,
> 				 enum devlink_command cmd, int flags)
> {
>+	struct devlink_port *devlink_port = info->user_ptr[1];
> 	struct devlink *devlink = info->user_ptr[0];
> 	struct devlink_resource *resource;
> 	struct nlattr *resources_attr;
>@@ -257,6 +258,10 @@ static int devlink_resource_fill(struct genl_info *info,
> 	if (devlink_nl_put_handle(skb, devlink))
> 		goto nla_put_failure;
> 
>+	if (devlink_port && nla_put_u32(skb, DEVLINK_ATTR_PORT_INDEX,
>+					devlink_port->index))
>+		goto nla_put_failure;
>+
> 	resources_attr = nla_nest_start_noflag(skb,
> 					       DEVLINK_ATTR_RESOURCE_LIST);
> 	if (!resources_attr)
>@@ -576,3 +581,99 @@ void devl_port_resources_unregister(struct devlink_port *devlink_port)
> 				    &devlink_port->resource_list);
> }
> EXPORT_SYMBOL_GPL(devl_port_resources_unregister);
>+
>+static int devlink_nl_port_resource_fill(struct sk_buff *msg,
>+					 struct devlink_port *devlink_port,
>+					 enum devlink_command cmd,
>+					 u32 portid, u32 seq, int flags)
>+{
>+	struct devlink *devlink = devlink_port->devlink;
>+	struct devlink_resource *resource;
>+	struct nlattr *resources_attr;
>+	void *hdr;
>+
>+	if (list_empty(&devlink_port->resource_list))
>+		return 0;
>+
>+	hdr = genlmsg_put(msg, portid, seq, &devlink_nl_family, flags, cmd);
>+	if (!hdr)
>+		return -EMSGSIZE;
>+
>+	if (devlink_nl_put_handle(msg, devlink))
>+		goto nla_put_failure;
>+	if (nla_put_u32(msg, DEVLINK_ATTR_PORT_INDEX, devlink_port->index))
>+		goto nla_put_failure;
>+
>+	resources_attr = nla_nest_start_noflag(msg, DEVLINK_ATTR_RESOURCE_LIST);
>+	if (!resources_attr)
>+		goto nla_put_failure;
>+
>+	list_for_each_entry(resource, &devlink_port->resource_list, list) {
>+		if (devlink_resource_put(devlink, msg, resource)) {
>+			nla_nest_cancel(msg, resources_attr);
>+			goto nla_put_failure;
>+		}
>+	}
>+	nla_nest_end(msg, resources_attr);
>+	genlmsg_end(msg, hdr);
>+	return 0;
>+
>+nla_put_failure:
>+	genlmsg_cancel(msg, hdr);
>+	return -EMSGSIZE;


Why you don't unify this function with existing devlink_resource_fill()?
Unnecessary code duplication, plus devlink_resource_fill() already know
how to handle multipart message.


This is related to my request to implement dump for devlink dev
resources. I would like to see the code unification for dump ops as
well.

Thanks!



>+}
>+
>+int devlink_nl_port_resource_get_doit(struct sk_buff *skb,
>+				      struct genl_info *info)
>+{
>+	struct devlink_port *devlink_port = info->user_ptr[1];
>+	struct sk_buff *msg;
>+	int err;
>+
>+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
>+	if (!msg)
>+		return -ENOMEM;
>+
>+	err = devlink_nl_port_resource_fill(msg, devlink_port,
>+					    DEVLINK_CMD_PORT_RESOURCE_GET,
>+					    info->snd_portid, info->snd_seq, 0);
>+	if (err) {
>+		nlmsg_free(msg);
>+		return err;
>+	}
>+
>+	return genlmsg_reply(msg, info);
>+}
>+
>+static int
>+devlink_nl_port_resource_get_dump_one(struct sk_buff *msg,
>+				      struct devlink *devlink,
>+				      struct netlink_callback *cb, int flags)
>+{
>+	enum devlink_command cmd = DEVLINK_CMD_PORT_RESOURCE_GET;
>+	struct devlink_nl_dump_state *state = devlink_dump_state(cb);
>+	struct devlink_port *devlink_port;
>+	unsigned long port_index;
>+	int err;
>+
>+	xa_for_each_start(&devlink->ports, port_index, devlink_port,
>+			  state->idx) {
>+		err = devlink_nl_port_resource_fill(msg, devlink_port,
>+						    cmd,
>+						    NETLINK_CB(cb->skb).portid,
>+						    cb->nlh->nlmsg_seq, flags);
>+		if (err) {
>+			state->idx = port_index;
>+			return err;
>+		}
>+	}
>+
>+	return 0;
>+}
>+
>+int devlink_nl_port_resource_get_dumpit(struct sk_buff *skb,
>+					struct netlink_callback *cb)
>+{
>+	return devlink_nl_dumpit(skb, cb,
>+				 devlink_nl_port_resource_get_dump_one);
>+}
>-- 
>2.44.0
>
