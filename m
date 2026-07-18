Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803643F0BE
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Jul 2026 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784413542; cv=none; b=Ya5SQOptZ8VFyzmzmmb79Ebu5cwdNlpIEHgGXXejqj6r1pj/2LoGOGlrS+kJcTTCvgOwtyPCurfH04T+GKT5JQHiqxHe+PTHRyE2TqJFO3ep599x2C4eO1KtBeR6oTvXAltusBJe2GLf5fw/CVsioDFZmGg32DG0HrAaBObaeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784413542; c=relaxed/simple;
	bh=iAJId+fn/avIvC3CYFnfQ7MRSLvCzuWWCqz5z9IG35Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki03/IdHKEUpFUekClrQmWuGhAJZQxjHnW3o1vhcDysLRvVroexoQn8AqEV1t8XSbsIRZLZP4IQApdx1wD9MB1HL92sPcLq0As1PqqHbqy0sK2qv7DMTxCrIgaJmPkWvBRriOtAJGjoTUPp9hht8J+aikwueQ4rOBk+JLUVwlK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kozkYBnV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kozkYBnV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f706438c3so7443f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Jul 2026 15:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784413539; x=1785018339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1+wiYmKLRRINoC4qepelpsntaD3E21cdrWqd0ORzOqg=;
        b=kozkYBnV1aofr3MIfUiQ6g3MTTg5nqpv1Fm2oALM/bxL4vmVQN57tlinf3oFQx7GCH
         xjRoZsQOnnva0KcQkmuDDhaprhw3OnkDd6jNVLaGJOuSA87s60tCH+tBQnx/8A7mtl67
         Qd840cO68HFqeHn85jnTCEJZQIu3dMfP+fpgnUE611ZH57WX4fGKAsrTToGg/Kabx8tx
         0FpHQwa+m8Yyy55gj2QbLBBWzXkGBQTefT1nqGAtSc/Zxd5ySb/ktamg9axbbODrvyZD
         VD/KO3IblIuNgd5KAaYIvPGWK+Idtd4t92zKZV4uzeQR+7MmJ5zzj0e45QxsuyYKJcoL
         fp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784413539; x=1785018339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+wiYmKLRRINoC4qepelpsntaD3E21cdrWqd0ORzOqg=;
        b=ArM5ab5Xks/Cq4fN6iXSKyfo5VIMPT7I/cPFGAfQGB2RLrNFB7JZ+v+CDfbbmLquBS
         tLB7arPUhvW1jiF0WFSaExD7W31pxAKMkl4JXiVujl5dTG1gwQ53czoCTCWpnv7NUh8i
         oZg6e9rl6xuPy7uMzVijktcRam7Onagg4TIGA6CsSNPVmA+PJp7CFxF2hHoJbasx0LZX
         TVulffqBRLFR6LtoI8qSFJxRDtDPzuK/iKDtJEeuBK8AHCw+u3XqkKqElJXgb7NRkGwO
         1DNTR9HvTj/Cd5x8CBMrrY72CMbDfYhSEk8R9ojI74i4aHYyFdTmPmLEqg2gwoCatFrr
         U84Q==
X-Forwarded-Encrypted: i=1; AHgh+RrGxhKw1UvpDlWckXFljrsSCoFttkvPIOs9JmETtyfdUDi+Uu6u0CAlbqZs/H+vbzaYrknXhG3+hDBjgx6ZsBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLeMNo2LU+Nw5BoZvjx+XAANUKULmSzaAoceaISZIWMzHwN0L
	eEG8CvcHLjNSqdFH5TmzTUWy1XaGwOqFZjbZVteebzXKUNAlHs/PRryi
X-Gm-Gg: AfdE7cmx4WEOek2sCKPSbbpdKtgnkvC4LNmuHVwL3R81l9jIx86Fr2jQ7/+iUYkMC7z
	ZltCuqQPmwg3AJRbWfgT6z1mQcPU29oVngj9vMJuxIvRNhdqFnVPrMPnAQAA6DiaHCRnhXzYbt8
	QB0k+A5xmRag2axFXjGDGoj1vQgwVg5NDHfPwFjMkRg9KE+OPith3NkC3gClupR9DJsQH0qbSCZ
	ntHJNEbaVOL2Pzl278jvnW00aNvsj6GiM6HmT0KBB4dGSTDTZY7oLjE6ymqazZgUmAtHRXHfALl
	sVOWxX1Tkxp09zYpuDrlaxrldGOTsfq7AdvB0OTxyeddh/8ZMPpjlMutBu0dQ0UBTL0pIlDWRrD
	5AEljlJd/68xTZsAAry1B+5wCOg2NzpBvom2AEupmGPYeFldNfkHGHez+ElH3L7FYoXhDfQ==
X-Received: by 2002:a05:6000:2892:b0:476:7e04:c399 with SMTP id ffacd0b85a97d-47f62329264mr6004655f8f.7.1784413538527;
        Sat, 18 Jul 2026 15:25:38 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d40e:d500:2769:8cc0:9049:e503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49acesm14770232f8f.6.2026.07.18.15.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 15:25:37 -0700 (PDT)
Date: Sun, 19 Jul 2026 01:25:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, andrew+netdev@lunn.ch,
	Jiri Pirko <jiri@resnulli.us>,
	Donald Hunter <donald.hunter@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/4] genetlink: apply reject policy for split
 ops on the dispatch path
Message-ID: <20260718222535.7lfuelgt6u63qqal@skbuf>
References: <20260311032839.417748-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311032839.417748-1-kuba@kernel.org>

Hi Jakub,

On Tue, Mar 10, 2026 at 08:28:35PM -0700, Jakub Kicinski wrote:
> Looks like I somehow missed adding default reject policies to commands
> in families using split Netlink ops. I realized this randomly trying
> to dump page pools for a specific device and always getting all of them
> back. The per-device dump is simply not implemented so the request
> should have been rejected. Patch 2 is the real change, the rest is
> just accompaniment.
> 
> v2:
>  - add patch 1 to avoid breaking devlink
>  - add a lot more tests
> v1: https://lore.kernel.org/20260307204425.1900467-1-kuba@kernel.org
> 
> Jakub Kicinski (4):
>   genetlink: use maxattr of 0 for the reject policy
>   genetlink: apply reject policy for split ops on the dispatch path
>   selftests: net: make sure that Netlink rejects unknown attrs in dump
>   selftests: net: add test for Netlink policy dumps
> 
>  tools/testing/selftests/net/Makefile          |   1 +
>  net/netlink/genetlink.c                       |  20 +--
>  net/netlink/policy.c                          |   4 +-
>  .../testing/selftests/net/lib/py/__init__.py  |   5 +-
>  tools/testing/selftests/net/lib/py/ynl.py     |  10 +-
>  tools/testing/selftests/net/nl_netdev.py      |  32 ++++-
>  tools/testing/selftests/net/nl_nlctrl.py      | 135 ++++++++++++++++++
>  7 files changed, 186 insertions(+), 21 deletions(-)
>  create mode 100755 tools/testing/selftests/net/nl_nlctrl.py
> 
> -- 
> 2.53.0
> 
> 

It looks like this patch set broke at least filtered DEVLINK_CMD_GET/
DEVLINK_CMD_INFO_GET dumps in general and mv88e6xxx_dump in particular
(https://github.com/lunn/mv88e6xxx_dump).

I didn't follow the split ops development, but here it seems that the
idea to reject unknown attributes in dumps at the genetlink core layer
interacts negatively with devlink's use of split ops. See

int devlink_nl_dumpit(struct sk_buff *msg, struct netlink_callback *cb,
		      devlink_nl_dump_one_func_t *dump_one)
{
	const struct genl_info *info = genl_info_dump(cb);
	struct nlattr **attrs = info->attrs;
	int flags = NLM_F_MULTI;

	if (attrs &&								\
	    (attrs[DEVLINK_ATTR_BUS_NAME] || attrs[DEVLINK_ATTR_DEV_NAME] ||	|
	     attrs[DEVLINK_ATTR_INDEX]))					| Your patch is shunting
		return devlink_nl_inst_single_dumpit(msg, cb, flags, dump_one,	| this entire branch
						     attrs);			|
	else									/
		return devlink_nl_inst_iter_dumpit(msg, cb, flags, dump_one);   // only this will work
}

In mv88e6xxx_dump we have the following affected pattern
(DEVLINK_CMD_INFO_GET netlink command with the NLM_F_DUMP flag which
also attaches attributes):

static void get_info(struct mv88e6xxx_ctx *ctx)
{
	struct nlmsghdr *nlh;
	uint16_t flags = NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP;
	int err;

	nlh = mnlg_msg_prepare(ctx->nlg, DEVLINK_CMD_INFO_GET, flags);
	mnl_attr_put_strz(nlh, DEVLINK_ATTR_BUS_NAME, ctx->bus_name);
	mnl_attr_put_strz(nlh, DEVLINK_ATTR_DEV_NAME, ctx->dev_name);

	err = _mnlg_socket_sndrcv(ctx->nlg, nlh, get_info_cb, ctx);
	if (err) {
		printf("Unable to get devices info\n");
		exit(EXIT_FAILURE);
	}
}

In the kernel, the devlink_nl_ops[] split_ops item for DEVLINK_CMD_INFO_GET
is _not_ defined with a policy for attributes. So your patch rejects it,
and that causes the regression.

I didn't review the entire devlink code, but I did review the entire
mv88e6xxx_dump code, and that is the only breakage.

We also have the following unaffected user space calls:

1.
static void list(struct mv88e6xxx_ctx *ctx)
{
	struct nlmsghdr *nlh;
	uint16_t flags = NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP;

	nlh = mnlg_msg_prepare(ctx->nlg, DEVLINK_CMD_GET, flags);
	_mnlg_socket_sndrcv(ctx->nlg, nlh, list_cb, ctx);
}

The split_op for DEVLINK_CMD_GET also does not have a policy for
attributes, but we do not populate attributes (OK). The code does go
through devlink_nl_dumpit(), so the regression potential is there, it is
just not triggered with mv88e6xxx_dump.

2.
static void delete_snapshots(struct mv88e6xxx_ctx *ctx)
{
	struct nlmsghdr *nlh;
	uint16_t flags = NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP;

	/* Sending a new message while decoding an older message
	 * results in problems. So keep repeating until all regions
	 * snapshots are gone. */
	do {
		ctx->repeat = false;
		nlh = mnlg_msg_prepare(ctx->nlg, DEVLINK_CMD_REGION_GET, flags);
		mnl_attr_put_strz(nlh, DEVLINK_ATTR_BUS_NAME, ctx->bus_name);
		mnl_attr_put_strz(nlh, DEVLINK_ATTR_DEV_NAME, ctx->dev_name);

		_mnlg_socket_sndrcv(ctx->nlg, nlh, delete_snapshots_cb, ctx);
	} while (ctx->repeat);
}

The split_op for DEVLINK_CMD_REGION_GET *does* have a policy for the
attributes that we add to this command when emitting it with NLM_F_DUMP.

3.
static int dump_snapshot_port_id(struct mv88e6xxx_ctx *ctx,
				 uint32_t port, const char *region_name,
				 uint32_t id)
{
	struct nlmsghdr *nlh;
	int err;

	nlh = mnlg_msg_prepare(ctx->nlg, DEVLINK_CMD_REGION_READ,
			       NLM_F_REQUEST | NLM_F_ACK | NLM_F_DUMP);

	mnl_attr_put_strz(nlh, DEVLINK_ATTR_BUS_NAME, ctx->bus_name);
	mnl_attr_put_strz(nlh, DEVLINK_ATTR_DEV_NAME, ctx->dev_name);
	if (port != ~0)
		mnl_attr_put_u32(nlh, DEVLINK_ATTR_PORT_INDEX, port);
	mnl_attr_put_strz(nlh, DEVLINK_ATTR_REGION_NAME, region_name);
	mnl_attr_put_u32(nlh, DEVLINK_ATTR_REGION_SNAPSHOT_ID, id);

	err = _mnlg_socket_sndrcv(ctx->nlg, nlh, dump_snapshot_cb, ctx);
	if (err)
		printf("Unable to dump snapshot %s\n", region_name);

	return err;
}

Same discussion for DEVLINK_CMD_REGION_READ. It does have a policy for
attributes.


I'm not sending a patch because I don't know what patch to send.

There are multiple directions, really.

(a) semantically, I don't know whether what get_info() does makes a lot
of sense. It requests NLM_F_DUMP, requesting a listing of all attributes,
and it then also passes DEVLINK_ATTR_BUS_NAME and DEVLINK_ATTR_DEV_NAME,
to filter for a single device out of that dump. That should be semantically
equivalent to not specifying NLM_F_DUMP, because in the kernel that goes
through the doit split op for DEVLINK_CMD_INFO_GET (which does have a policy),
not through the dumpit one. And it even makes more sense - instead of
dumping and telling the kernel to filter, just get the info for the
device to which you already have a handle.

I'm personally OK with saying user space is odd in this case, and fixing it.
If Andrew is OK too and will accept a patch removing NLM_F_DUMP from
get_info(), I can send this to mv88e6xxx_dump.

But technically it is an UAPI regression, so we should take that at face
value. Here is where the problems begin - I haven't reviewed all
possible dumpit commands, and I don't have time to do so.

(b) we can exempt all legacy split ops from your blanket policy rejection.
Essentially make genl_op_fill_in_reject_policy_split() do the same thing
as genl_op_fill_in_reject_policy():

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 0da39eaed255..61d249b9b089 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -114,7 +114,7 @@ static void
 genl_op_fill_in_reject_policy_split(const struct genl_family *family,
 				    struct genl_split_ops *op)
 {
-	if (op->policy)
+	if (op->policy || op->cmd < family->resv_start_op)
 		return;
 
 	op->policy = genl_policy_reject_all;

I think you are not in favour of this approach, because in commit
e3a5b7f8ef2a ("genetlink: apply reject policy for split ops on the
dispatch path") you said:

    If anyone reports issues we should probably fill in fake policies
    for specific ops rather than reverting this.

so in case that remains your desire, we have the following direction:

(c) add attributes to the netlink schema of all devlink commands that
support dumps (they all go through devlink_nl_dumpit() which parses them).

Essentially the patch below, generated with larger -U25 context for
clarity, and the tools/net/ynl/ynl-regen.sh output omitted for brevity.

--- a/Documentation/netlink/specs/devlink.yaml
+++ b/Documentation/netlink/specs/devlink.yaml
@@ -1318,50 +1318,52 @@ operations:
   enum-model: directional
   list:
     -
       name: get
       doc: Get devlink instances.
       attribute-set: devlink
       dont-validate: [strict, dump]
       do:
         pre: devlink-nl-pre-doit
         post: devlink-nl-post-doit
         request:
           value: 1
           attributes: &dev-id-attrs
             - bus-name
             - dev-name
             - index
         reply: &get-reply
           value: 3
           attributes:
             - bus-name
             - dev-name
             - index
             - reload-failed
             - dev-stats
       dump:
+        request:
+          attributes: *dev-id-attrs
         reply: *get-reply

     -
       name: port-get
       doc: Get devlink port instances.
       attribute-set: devlink
       dont-validate: [strict]
       do:
         pre: devlink-nl-pre-doit-port
         post: devlink-nl-post-doit
         request:
           value: 5
           attributes: &port-id-attrs
             - bus-name
             - dev-name
             - index
             - port-index
         reply:
           value: 7
           attributes: *port-id-attrs
       dump:
         request:
           attributes: *dev-id-attrs
         reply:
           value: 3  # due to a bug, port dump returns DEVLINK_CMD_NEW
@@ -1984,50 +1986,52 @@ operations:
       name: info-get
       doc: |
         Get device information, like driver name, hardware and firmware versions
         etc.
       attribute-set: devlink
       dont-validate: [strict, dump]
       do:
         pre: devlink-nl-pre-doit
         post: devlink-nl-post-doit
         request:
           value: 51
           attributes: *dev-id-attrs
         reply: &info-get-reply
           value: 51
           attributes:
             - bus-name
             - dev-name
             - index
             - info-driver-name
             - info-serial-number
             - info-version-fixed
             - info-version-running
             - info-version-stored
             - info-board-serial-number
       dump:
+        request:
+          attributes: *dev-id-attrs
         reply: *info-get-reply

     -
       name: health-reporter-get
       doc: Get health reporter instances.
       attribute-set: devlink
       dont-validate: [strict]
       do:
         pre: devlink-nl-pre-doit-port-optional
         post: devlink-nl-post-doit
         request:
           attributes: &health-reporter-id-attrs
             - bus-name
             - dev-name
             - index
             - port-index
             - health-reporter-name
         reply: &health-reporter-get-reply
           attributes: *health-reporter-id-attrs
       dump:
         request:
           attributes: *port-id-attrs
         reply: *health-reporter-get-reply

     -

But this is where things get a bit more interesting. Technically only
devlink info-get regressed in mv88e6xxx_dump. Do we fix devlink get too?
How far should this investigation go? I don't really want to go into a
very deep rabbit hole. In this sense option (b) may be preferable if
avoiding UAPI regressions is our main objective.

Thanks for reading what turned out a rather long email, and sorry if I
got anything wrong. I'm not a netlink expert by any stretch of imagination.
