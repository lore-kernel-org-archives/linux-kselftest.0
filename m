From: ldir@darbyshire-bryant.me.uk (Kevin 'ldir' Darbyshire-Bryant)
Date: Sat, 27 Apr 2019 13:08:13 +0000
Subject: [PATCH net-next] net: sched: Introduce act_ctinfo action
Message-ID: <20190427130739.44614-1-ldir@darbyshire-bryant.me.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190427130813.5V7LFZeRu5YA9hfrREPcBECBJX2PD5qbWoLzNiYJ7ig@z>

ctinfo is a new tc filter action module.  It is designed to restore DSCPs
stored in conntrack marks into the ipv4/v6 diffserv field.

The feature is intended for use and has been found useful for restoring
ingress classifications based on egress classifications across links
that bleach or otherwise change DSCP, typically home ISP Internet links.
Restoring DSCP on ingress on the WAN link allows qdiscs such as CAKE to
shape inbound packets according to policies that are easier to indicate
on egress.

Ingress classification is traditionally a challenging task since
iptables rules haven't yet run and tc filter/eBPF programs are pre-NAT
lookups, hence are unable to see internal IPv4 addresses as used on the
typical home masquerading gateway.

ctinfo understands the following parameters:

dscp dscpmask[/statemask]

dscpmask - a 32 bit mask of at least 6 contiguous bits and indicates
where ctinfo will find the DSCP bits stored in the conntrack mark.

statemask - a 32 bit mask of (usually) 1 bit length, outside the area
specified by dscpmask.  This represents a conditional operation flag
whereby the DSCP is only restored if the flag is set.  This is useful to
implement a 'one shot' iptables based classification where the
'complicated' iptables rules are only run once to classify the
connection on initial (egress) packet and subsequent packets are all
marked/restored with the same DSCP.  A mask of zero disables the
conditional behaviour ie. the conntrack mark DSCP bits are always
restored to the ip diffserv field (assuming the conntrack entry is found
& the skb is an ipv4/ipv6 type)

optional parameters:

zone - conntrack zone

control - action related control (reclassify | pipe | drop | continue |
ok | goto chain <CHAIN_INDEX>)

e.g. dscp 0xfc000000/0x01000000

|----0xFC----conntrack mark----000000---|
| Bits 31-26 | bit 25 | bit24 |~~~ Bit 0|
| DSCP       | unused | flag  |unused   |
|-----------------------0x01---000000---|
      |                   |
      |                   |
      ---|             Conditional flag
         v             only restore if set
|-ip diffserv-|
| 6 bits      |
|-------------|

Signed-off-by: Kevin Darbyshire-Bryant <ldir at darbyshire-bryant.me.uk>
---
 include/net/tc_act/tc_ctinfo.h            |  24 ++
 include/uapi/linux/pkt_cls.h              |   1 +
 include/uapi/linux/tc_act/tc_ctinfo.h     |  33 ++
 net/sched/Kconfig                         |  13 +
 net/sched/Makefile                        |   1 +
 net/sched/act_ctinfo.c                    | 375 ++++++++++++++++++++++
 tools/testing/selftests/tc-testing/config |   1 +
 7 files changed, 448 insertions(+)
 create mode 100644 include/net/tc_act/tc_ctinfo.h
 create mode 100644 include/uapi/linux/tc_act/tc_ctinfo.h
 create mode 100644 net/sched/act_ctinfo.c

diff --git a/include/net/tc_act/tc_ctinfo.h b/include/net/tc_act/tc_ctinfo.h
new file mode 100644
index 000000000000..bb33e66d3ea5
--- /dev/null
+++ b/include/net/tc_act/tc_ctinfo.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __NET_TC_CTINFO_H
+#define __NET_TC_CTINFO_H
+
+#include <net/act_api.h>
+
+struct tcf_ctinfo_params {
+	struct net *net;
+	u32 dscpmask;
+	u32 dscpstatemask;
+	u16 zone;
+	u8 mode;
+	u8 dscpmaskshift;
+	struct rcu_head rcu;
+};
+
+struct tcf_ctinfo {
+	struct tc_action common;
+	struct tcf_ctinfo_params __rcu *params;
+};
+
+#define to_ctinfo(a) ((struct tcf_ctinfo *)a)
+
+#endif /* __NET_TC_CTINFO_H */
diff --git a/include/uapi/linux/pkt_cls.h b/include/uapi/linux/pkt_cls.h
index 51a0496f78ea..a93680fc4bfa 100644
--- a/include/uapi/linux/pkt_cls.h
+++ b/include/uapi/linux/pkt_cls.h
@@ -105,6 +105,7 @@ enum tca_id {
 	TCA_ID_IFE = TCA_ACT_IFE,
 	TCA_ID_SAMPLE = TCA_ACT_SAMPLE,
 	/* other actions go here */
+	TCA_ID_CTINFO,
 	__TCA_ID_MAX = 255
 };
 
diff --git a/include/uapi/linux/tc_act/tc_ctinfo.h b/include/uapi/linux/tc_act/tc_ctinfo.h
new file mode 100644
index 000000000000..b84902b5e3b1
--- /dev/null
+++ b/include/uapi/linux/tc_act/tc_ctinfo.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef __UAPI_TC_CTINFO_H
+#define __UAPI_TC_CTINFO_H
+
+#include <linux/types.h>
+#include <linux/pkt_cls.h>
+
+struct tc_ctinfo {
+	tc_gen;
+};
+
+struct tc_ctinfo_dscp {
+	__u32 mask;
+	__u32 statemask;
+};
+
+enum {
+	TCA_CTINFO_UNSPEC,
+	TCA_CTINFO_ACT,
+	TCA_CTINFO_ZONE,
+	TCA_CTINFO_DSCP_PARMS,
+	TCA_CTINFO_MODE_DSCP,
+	TCA_CTINFO_TM,
+	TCA_CTINFO_PAD,
+	__TCA_CTINFO_MAX
+};
+#define TCA_CTINFO_MAX (__TCA_CTINFO_MAX - 1)
+
+enum {
+	CTINFO_MODE_SETDSCP	= BIT(0)
+};
+
+#endif
diff --git a/net/sched/Kconfig b/net/sched/Kconfig
index 5c02ad97ef23..5ac01c5ebae9 100644
--- a/net/sched/Kconfig
+++ b/net/sched/Kconfig
@@ -876,6 +876,19 @@ config NET_ACT_CONNMARK
 	  To compile this code as a module, choose M here: the
 	  module will be called act_connmark.
 
+config NET_ACT_CTINFO
+        tristate "Netfilter Connmark to DSCP Retriever"
+        depends on NET_CLS_ACT && NETFILTER && IP_NF_IPTABLES
+        depends on NF_CONNTRACK && NF_CONNTRACK_MARK
+        help
+	  Say Y here to allow transfer of a connmark stored DSCP into
+	  ipv4/v6 diffserv
+
+	  If unsure, say N.
+
+	  To compile this code as a module, choose M here: the
+	  module will be called act_ctinfo.
+
 config NET_ACT_SKBMOD
         tristate "skb data modification action"
         depends on NET_CLS_ACT
diff --git a/net/sched/Makefile b/net/sched/Makefile
index 8a40431d7b5c..d54bfcbd7981 100644
--- a/net/sched/Makefile
+++ b/net/sched/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_NET_ACT_CSUM)	+= act_csum.o
 obj-$(CONFIG_NET_ACT_VLAN)	+= act_vlan.o
 obj-$(CONFIG_NET_ACT_BPF)	+= act_bpf.o
 obj-$(CONFIG_NET_ACT_CONNMARK)	+= act_connmark.o
+obj-$(CONFIG_NET_ACT_CTINFO)	+= act_ctinfo.o
 obj-$(CONFIG_NET_ACT_SKBMOD)	+= act_skbmod.o
 obj-$(CONFIG_NET_ACT_IFE)	+= act_ife.o
 obj-$(CONFIG_NET_IFE_SKBMARK)	+= act_meta_mark.o
diff --git a/net/sched/act_ctinfo.c b/net/sched/act_ctinfo.c
new file mode 100644
index 000000000000..01a8694651ea
--- /dev/null
+++ b/net/sched/act_ctinfo.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+/* net/sched/act_ctinfo.c  netfilter ctinfo connmark->DSCP action
+ *
+ * Copyright (c) 2019 Kevin Darbyshire-Bryant <ldir at darbyshire-bryant.me.uk>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/skbuff.h>
+#include <linux/rtnetlink.h>
+#include <linux/pkt_cls.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
+#include <net/netlink.h>
+#include <net/pkt_sched.h>
+#include <net/act_api.h>
+#include <net/pkt_cls.h>
+#include <uapi/linux/tc_act/tc_ctinfo.h>
+#include <net/tc_act/tc_ctinfo.h>
+
+#include <net/netfilter/nf_conntrack.h>
+#include <net/netfilter/nf_conntrack_core.h>
+#include <net/netfilter/nf_conntrack_ecache.h>
+#include <net/netfilter/nf_conntrack_zones.h>
+
+static unsigned int ctinfo_net_id;
+static struct tc_action_ops act_ctinfo_ops;
+
+static void tcf_ctinfo_dscp_set(struct nf_conn *ct, struct tcf_ctinfo *ca,
+				struct tcf_ctinfo_params *cp,
+				struct sk_buff *skb, int wlen, int proto)
+{
+	u8 dscp, newdscp;
+
+	newdscp = (((ct->mark & cp->dscpmask) >> cp->dscpmaskshift) << 2) &
+		     ~INET_ECN_MASK;
+
+	/* mark contains DSCP so restore DSCP bits from c->mark into diffserv */
+	/* using overlimits stats to count how many DSCP updates */
+	switch (proto) {
+	case NFPROTO_IPV4:
+		dscp = ipv4_get_dsfield(ip_hdr(skb)) & ~INET_ECN_MASK;
+		if (dscp != newdscp) {
+			if (!skb_try_make_writable(skb, wlen)) {
+				ipv4_change_dsfield(ip_hdr(skb),
+						    INET_ECN_MASK,
+						    newdscp);
+				ca->tcf_qstats.overlimits++;
+			} else {
+				ca->tcf_qstats.drops++;
+			}
+		}
+		break;
+	case NFPROTO_IPV6:
+		dscp = ipv6_get_dsfield(ipv6_hdr(skb)) & ~INET_ECN_MASK;
+		if (dscp != newdscp) {
+			if (!skb_try_make_writable(skb, wlen)) {
+				ipv6_change_dsfield(ipv6_hdr(skb),
+						    INET_ECN_MASK,
+						    newdscp);
+				ca->tcf_qstats.overlimits++;
+			} else {
+				ca->tcf_qstats.drops++;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static int tcf_ctinfo_act(struct sk_buff *skb, const struct tc_action *a,
+			  struct tcf_result *res)
+{
+	const struct nf_conntrack_tuple_hash *thash = NULL;
+	struct nf_conntrack_tuple tuple;
+	enum ip_conntrack_info ctinfo;
+	struct tcf_ctinfo *ca = to_ctinfo(a);
+	struct tcf_ctinfo_params *cp;
+	struct nf_conntrack_zone zone;
+	struct nf_conn *ct;
+	int proto, wlen;
+	int action;
+
+	cp = rcu_dereference_bh(ca->params);
+
+	tcf_lastuse_update(&ca->tcf_tm);
+	bstats_update(&ca->tcf_bstats, skb);
+	action = READ_ONCE(ca->tcf_action);
+
+	/* currently the only mode we know but in future...*/
+	if (unlikely(!(cp->mode & CTINFO_MODE_SETDSCP)))
+		goto out;
+
+	wlen = skb_network_offset(skb);
+	if (tc_skb_protocol(skb) == htons(ETH_P_IP)) {
+		wlen += sizeof(struct iphdr);
+		if (!pskb_may_pull(skb, wlen))
+			goto out;
+
+		proto = NFPROTO_IPV4;
+	} else if (tc_skb_protocol(skb) == htons(ETH_P_IPV6)) {
+		wlen += sizeof(struct ipv6hdr);
+		if (!pskb_may_pull(skb, wlen))
+			goto out;
+
+		proto = NFPROTO_IPV6;
+	} else {
+		goto out;
+	}
+
+	ct = nf_ct_get(skb, &ctinfo);
+	if (!ct) { /* look harder usually ingress */
+		if (!nf_ct_get_tuplepr(skb, skb_network_offset(skb),
+				       proto, cp->net, &tuple))
+			goto out;
+		zone.id = cp->zone;
+		zone.dir = NF_CT_DEFAULT_ZONE_DIR;
+
+		thash = nf_conntrack_find_get(cp->net, &zone, &tuple);
+		if (!thash)
+			goto out;
+
+		ct = nf_ct_tuplehash_to_ctrack(thash);
+	}
+
+	if (!cp->dscpstatemask || (ct->mark & cp->dscpstatemask))
+		tcf_ctinfo_dscp_set(ct, ca, cp, skb, wlen, proto);
+
+	if (thash)
+		nf_ct_put(ct);
+out:
+	return action;
+}
+
+static const struct nla_policy ctinfo_policy[TCA_CTINFO_MAX + 1] = {
+	[TCA_CTINFO_ACT] = { .len = sizeof(struct tc_ctinfo) },
+	[TCA_CTINFO_ZONE] = { .type = NLA_U16 },
+	[TCA_CTINFO_MODE_DSCP] = { .type = NLA_FLAG },
+	[TCA_CTINFO_DSCP_PARMS] = { .len = sizeof(struct tc_ctinfo_dscp) },
+};
+
+static int tcf_ctinfo_init(struct net *net, struct nlattr *nla,
+			   struct nlattr *est, struct tc_action **a,
+			   int ovr, int bind, bool rtnl_held,
+			   struct tcf_proto *tp,
+			   struct netlink_ext_ack *extack)
+{
+	struct tc_action_net *tn = net_generic(net, ctinfo_net_id);
+	struct tcf_ctinfo_params *cp_new;
+	struct nlattr *tb[TCA_CTINFO_MAX + 1];
+	struct tcf_chain *goto_ch = NULL;
+	struct tcf_ctinfo *ci;
+	struct tc_ctinfo *actparm;
+	struct tc_ctinfo_dscp *dscpparm;
+	int ret = 0, err, i;
+
+	if (!nla)
+		return -EINVAL;
+
+	err = nla_parse_nested(tb, TCA_CTINFO_MAX, nla, ctinfo_policy, NULL);
+	if (err < 0)
+		return err;
+
+	if (!tb[TCA_CTINFO_ACT])
+		return -EINVAL;
+
+	if (tb[TCA_CTINFO_MODE_DSCP] && !tb[TCA_CTINFO_DSCP_PARMS])
+		return -EINVAL;
+
+	actparm = nla_data(tb[TCA_CTINFO_ACT]);
+	dscpparm = nla_data(tb[TCA_CTINFO_DSCP_PARMS]);
+
+	if (dscpparm) {
+		/* need at least contiguous 6 bit mask */
+		i = dscpparm->mask ? __ffs(dscpparm->mask) : 0;
+		if ((0x3f & (dscpparm->mask >> i)) != 0x3f)
+			return -EINVAL;
+		/* mask & statemask must not overlap */
+		if (dscpparm->mask & dscpparm->statemask)
+			return -EINVAL;
+	}
+//done the validation:now to the actual action allocation
+	err = tcf_idr_check_alloc(tn, &actparm->index, a, bind);
+	if (!err) {
+		ret = tcf_idr_create(tn, actparm->index, est, a,
+				     &act_ctinfo_ops, bind, false);
+		if (ret) {
+			tcf_idr_cleanup(tn, actparm->index);
+			return ret;
+		}
+	} else if (err > 0) {
+		if (bind) /* don't override defaults */
+			return 0;
+		if (!ovr) {
+			tcf_idr_release(*a, bind);
+			return -EEXIST;
+		}
+	} else {
+		return err;
+	}
+
+	err = tcf_action_check_ctrlact(actparm->action, tp, &goto_ch, extack);
+	if (err < 0)
+		goto release_idr;
+
+	ci = to_ctinfo(*a);
+
+	cp_new = kzalloc(sizeof(*cp_new), GFP_KERNEL);
+	if (unlikely(!cp_new)) {
+		err = -ENOMEM;
+		goto put_chain;
+	}
+
+	cp_new->net = net;
+	cp_new->zone = tb[TCA_CTINFO_ZONE] ?
+			nla_get_u16(tb[TCA_CTINFO_ZONE]) : 0;
+	if (dscpparm) {
+		cp_new->dscpmask = dscpparm->mask;
+		cp_new->dscpmaskshift = cp_new->dscpmask ?
+				__ffs(cp_new->dscpmask) : 0;
+		cp_new->dscpstatemask = dscpparm->statemask;
+	}
+
+	if (tb[TCA_CTINFO_MODE_DSCP])
+		cp_new->mode |= CTINFO_MODE_SETDSCP;
+	else
+		cp_new->mode &= ~CTINFO_MODE_SETDSCP;
+
+	spin_lock_bh(&ci->tcf_lock);
+	goto_ch = tcf_action_set_ctrlact(*a, actparm->action, goto_ch);
+	rcu_swap_protected(ci->params, cp_new,
+			   lockdep_is_held(&ci->tcf_lock));
+	spin_unlock_bh(&ci->tcf_lock);
+
+	if (goto_ch)
+		tcf_chain_put_by_act(goto_ch);
+	if (cp_new)
+		kfree_rcu(cp_new, rcu);
+
+	if (ret == ACT_P_CREATED)
+		tcf_idr_insert(tn, *a);
+
+	return ret;
+
+put_chain:
+	if (goto_ch)
+		tcf_chain_put_by_act(goto_ch);
+release_idr:
+	tcf_idr_release(*a, bind);
+	return err;
+}
+
+static inline int tcf_ctinfo_dump(struct sk_buff *skb, struct tc_action *a,
+				  int bind, int ref)
+{
+	unsigned char *b = skb_tail_pointer(skb);
+	struct tcf_ctinfo *ci = to_ctinfo(a);
+	struct tcf_ctinfo_params *cp;
+	struct tc_ctinfo opt = {
+		.index   = ci->tcf_index,
+		.refcnt  = refcount_read(&ci->tcf_refcnt) - ref,
+		.bindcnt = atomic_read(&ci->tcf_bindcnt) - bind,
+	};
+	struct tcf_t t;
+	struct tc_ctinfo_dscp dscpparm;
+
+	spin_lock_bh(&ci->tcf_lock);
+	cp = rcu_dereference_protected(ci->params,
+				       lockdep_is_held(&ci->tcf_lock));
+	opt.action = ci->tcf_action;
+
+	if (nla_put(skb, TCA_CTINFO_ACT, sizeof(opt), &opt))
+		goto nla_put_failure;
+
+	if (cp->mode & CTINFO_MODE_SETDSCP) {
+		dscpparm.mask = cp->dscpmask;
+		dscpparm.statemask = cp->dscpstatemask;
+		if (nla_put(skb, TCA_CTINFO_DSCP_PARMS, sizeof(dscpparm),
+			    &dscpparm))
+			goto nla_put_failure;
+
+		if (nla_put_flag(skb, TCA_CTINFO_MODE_DSCP))
+			goto nla_put_failure;
+	}
+
+	if (cp->zone) {
+		if (nla_put_u16(skb, TCA_CTINFO_ZONE, cp->zone))
+			goto nla_put_failure;
+	}
+
+	tcf_tm_dump(&t, &ci->tcf_tm);
+	if (nla_put_64bit(skb, TCA_CTINFO_TM, sizeof(t), &t,
+			  TCA_CTINFO_PAD))
+		goto nla_put_failure;
+
+	spin_unlock_bh(&ci->tcf_lock);
+
+	return skb->len;
+
+nla_put_failure:
+	spin_unlock_bh(&ci->tcf_lock);
+	nlmsg_trim(skb, b);
+	return -1;
+}
+
+static int tcf_ctinfo_walker(struct net *net, struct sk_buff *skb,
+			     struct netlink_callback *cb, int type,
+			     const struct tc_action_ops *ops,
+			     struct netlink_ext_ack *extack)
+{
+	struct tc_action_net *tn = net_generic(net, ctinfo_net_id);
+
+	return tcf_generic_walker(tn, skb, cb, type, ops, extack);
+}
+
+static int tcf_ctinfo_search(struct net *net, struct tc_action **a, u32 index)
+{
+	struct tc_action_net *tn = net_generic(net, ctinfo_net_id);
+
+	return tcf_idr_search(tn, a, index);
+}
+
+static struct tc_action_ops act_ctinfo_ops = {
+	.kind		=	"ctinfo",
+	.id		=	TCA_ID_CTINFO,
+	.owner		=	THIS_MODULE,
+	.act		=	tcf_ctinfo_act,
+	.dump		=	tcf_ctinfo_dump,
+	.init		=	tcf_ctinfo_init,
+	.walk		=	tcf_ctinfo_walker,
+	.lookup		=	tcf_ctinfo_search,
+	.size		=	sizeof(struct tcf_ctinfo),
+};
+
+static __net_init int ctinfo_init_net(struct net *net)
+{
+	struct tc_action_net *tn = net_generic(net, ctinfo_net_id);
+
+	return tc_action_net_init(tn, &act_ctinfo_ops);
+}
+
+static void __net_exit ctinfo_exit_net(struct list_head *net_list)
+{
+	tc_action_net_exit(net_list, ctinfo_net_id);
+}
+
+static struct pernet_operations ctinfo_net_ops = {
+	.init = ctinfo_init_net,
+	.exit_batch = ctinfo_exit_net,
+	.id   = &ctinfo_net_id,
+	.size = sizeof(struct tc_action_net),
+};
+
+static int __init ctinfo_init_module(void)
+{
+	return tcf_register_action(&act_ctinfo_ops, &ctinfo_net_ops);
+}
+
+static void __exit ctinfo_cleanup_module(void)
+{
+	tcf_unregister_action(&act_ctinfo_ops, &ctinfo_net_ops);
+}
+
+module_init(ctinfo_init_module);
+module_exit(ctinfo_cleanup_module);
+MODULE_AUTHOR("Kevin Darbyshire-Bryant <ldir at darbyshire-bryant.me.uk>");
+MODULE_DESCRIPTION("Conntrack mark to DSCP restoring");
+MODULE_LICENSE("GPL");
diff --git a/tools/testing/selftests/tc-testing/config b/tools/testing/selftests/tc-testing/config
index 203302065458..9d1fddcfb887 100644
--- a/tools/testing/selftests/tc-testing/config
+++ b/tools/testing/selftests/tc-testing/config
@@ -37,6 +37,7 @@ CONFIG_NET_ACT_SKBEDIT=m
 CONFIG_NET_ACT_CSUM=m
 CONFIG_NET_ACT_VLAN=m
 CONFIG_NET_ACT_BPF=m
+CONFIG_NET_ACT_CONNDSCP=m
 CONFIG_NET_ACT_CONNMARK=m
 CONFIG_NET_ACT_SKBMOD=m
 CONFIG_NET_ACT_IFE=m
-- 
2.20.1 (Apple Git-117)
