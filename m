Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F443C9EE9;
	Fri, 31 Jul 2026 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491812; cv=none; b=EJMKL3pbHZmCHDQrY0YMvcT3l5JGnmORknFu2wEkLZnryfT88696Erwoyv25dPh4g5IDAJgincptKj/BJRUVB0RrGGrVm8t5O0e2V4mqy5rZNuaZZ/fBCt8OEmyJP1iQJh/5GSm8HJXvYdkThrJ5OFjw3vbjDj+b5jm7jaXBClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491812; c=relaxed/simple;
	bh=DOwwg71Kekju6qLnmGfhTqtRNRbfyVhmg9zsJnHZLgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX5adfLfN3uG0IQXIiXWMIZxwcNOGEGtJYrIroSHcSB3iYCJ5iUXG+YjnF7lL/oLeSFIoZO0CKTflhszilBEPxZfWenXBy8C/wmjfXz6otrSqHy2a2dFoQ5/yVgc2VQWzchktTWgQ30bWPhQrbZPIltOovA+xexgTLN3z/Kb4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hINXc30n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hINXc30n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE51C1F000E9;
	Fri, 31 Jul 2026 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491800;
	bh=UJzatnBRREcF0bQmpNpCCB0NZsjOpJ4uKmlxw9TORHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hINXc30n0nbQqQo9tuwXgBfCoCBC3SwoZ7cfl/1LfbwEoZZd0eNlUseLRNl8vHPgm
	 XvIiiwJkwiEE9zAwIqlPTc0s3IXxdIRk4Hp4Mnt+GJKaSBG9Hw87FIesYgGHsaCzgf
	 k5esBgQMr3SyQ7jJwS7TCooU9pj7LCwNqb+SB3VHQvfJkTBZUo9BEtJ0ADUKZsd9Mk
	 1kuKcdSHftCWakbFVtYSf32BrM3g7PygJZ5gmiTpLuoDA1csONhHKfN2fOeZrsuijE
	 xDVqYZvH5M3k23JEU5zNhLHdyn/Frz0EorVYtdEhqHVqKXIh8MMlOZ6aWbn7QcxTyN
	 QpRSXOULspGzA==
Date: Fri, 31 Jul 2026 10:56:35 +0100
From: Simon Horman <horms@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jiri@resnulli.us,
	jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, vishy0777@gmail.com,
	tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v4 1/3] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
Message-ID: <20260731095635.GG51943@horms.kernel.org>
References: <20260727164056.106203-1-hemendranaik@gmail.com>
 <20260727164056.106203-2-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727164056.106203-2-hemendranaik@gmail.com>

On Mon, Jul 27, 2026 at 10:10:54PM +0530, Hemendra M. Naik wrote:

...

> +static struct tcf_block *fq_pie_tcf_block(struct Qdisc *sch, unsigned long cl,
> +					  struct netlink_ext_ack *extack)
> +{
> +	struct fq_pie_sched_data *q = qdisc_priv(sch);
> +
> +	if (cl)
> +		return NULL;
> +	return q->block;
> +}

Hi,

The AI-generated review of this patch on netdev-ai [1] reports several
findings. And while I'd appreciate it if you could look over each of them
the one below seems to warrant highlighting here.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260727164056.106203-1-hemendranaik%40gmail.com?part=1

   Is the side effect of making fq_pie filter-capable intended, and should
   it be described in the commit message?

   Before this patch fq_pie_qdisc_ops had no .cl_ops, so filter attachment
   was rejected in net/sched/cls_api.c:__tcf_qdisc_find():

	cops = (*q)->ops->cl_ops;
	if (!cops) {
		NL_SET_ERR_MSG(extack, "Qdisc not classful");
		err = -EINVAL;

   q->filter_list was therefore always NULL and the filter branch of
   fq_pie_classify() was unreachable since fq_pie was added.  With .cl_ops
   present and fq_pie_tcf_block() returning q->block, 'tc filter add ...
   parent <fq_pie handle>' now succeeds and classifier verdicts plus
   classid-driven flow selection become live in the enqueue fast path.

   That newly reachable code does not handle TC_ACT_CONSUMED:

   net/sched/sch_fq_pie.c:fq_pie_classify() {
	result = tcf_classify_qdisc(skb, filter, &res, false);
	if (result >= 0) {
		switch (result) {
		case TC_ACT_STOLEN:
		case TC_ACT_QUEUED:
		case TC_ACT_TRAP:
			*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
			fallthrough;
		case TC_ACT_SHOT:
			return 0;
		}
		if (TC_H_MIN(res.classid) <= q->flows_cnt)
			return TC_H_MIN(res.classid);
	}

   TC_ACT_CONSUMED is TC_ACT_VALUE_MAX + 1, so it is >= 0 and matches no
   case arm, and control reaches the classid path.  act_ct produces it
   after the skb ownership has already been handed away:

   net/sched/act_ct.c:tcf_ct_act() {
   out_frag:
	if (err != -EINPROGRESS)
		tcf_action_inc_drop_qstats(&c->common);
	return TC_ACT_CONSUMED;

   tcf_action_exec() propagates any value != TC_ACT_PIPE and
   __tcf_classify() returns it verbatim.  For a filter such as
	tc filter add dev eth0 parent 1: matchall action ct

   with no flowid, res.classid is 0, TC_H_MIN(0) <= flows_cnt holds and 0
   is returned, so fq_pie_qdisc_enqueue() frees the consumed skb a second
   time:

	idx = fq_pie_classify(skb, sch, &ret);
	if (idx == 0) {
		if (ret & __NET_XMIT_BYPASS)
			qdisc_qstats_drop(sch);
		__qdisc_drop(skb, to_free);

   and with 'flowid 1:N' a valid flow index is returned instead, so
   flow_queue_add() links the already freed skb into q->flows[idx].  Can
   fragmented traffic hitting that qdisc then cause a double free or
   use-after-free?

   That TC_ACT_CONSUMED is expected from qdisc-attached filter chains is
   also visible in net/sched/cls_api.c:tcf_qevent_handle(), which has an
   explicit case TC_ACT_CONSUMED: arm that must not free the skb.

   fq_codel, sfq and cake have the same missing arm, but for fq_pie the
   path only becomes reachable with this patch.

...
