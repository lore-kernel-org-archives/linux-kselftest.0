Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3A36402D
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730363; cv=none; b=QZ88pouIo1tP93y/jjFQtzRVxi7+aQ1SQALbGkn+LnOeheS7xIo5LkJoFyQ9wceqp4gtuZjp3rtUkrcQgU4qflNDCaZx2zkdHxY1EyFQbyKyyBzpS4rETaX0zbA3C3JxPn35uRIQtKrTM2MpRfJK+EU3d1EvPu5Ufhn+oc+ilRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730363; c=relaxed/simple;
	bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmahZx0+FPwoGwwYRKzXcLoF8tkVFBD2zOKfsgutROmGzPdEHLipjScB63msQpVDnab4sdoSK7TgJODzOzLF7nL4kuPtBzzEWuY2ClPa54GZFY1q6Ff6XbbzvnFukEKLve9srkody8Bw0bRD0Ma9gL8ePfXvwYoyTiJL1qfS0/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcTHCiWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB2bQfyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcTHCiWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB2bQfyp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEk82579076
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=; b=bcTHCiWxOiugwPib
	8HDNj5BIp4aaGBKPQ9EAztIhY9W6IE8NzwNP66CJNSru6o52xP8UOivFp1zYBjbE
	t+OaFyfdooNaLb3Z7iQs7aiPWKhpdw+FdmxLfXZxB64J+Ig2a301ImbzdV9AWMnq
	oU76HFygbwb6JtyA8S3Em/zhNIIOpReqhGX02cv3B1j7/RMCC39YXf3eNruxDnZn
	uwNgpRVB0Wfrxc/LM0BgHeW7DueSdkBxZ83XUoXTegcwdJiqxNfGURIHKXbsIIoC
	TykM3SJCq4RM12zyWBi3Qb9hmvaCNhS3CvZXH/PPLFD+xvFEoyulnvxvaU4o6Uqb
	OlbCuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gynb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 10:52:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9203d077d77so569895585a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730359; x=1783335159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=LB2bQfypO6uF80icBSaCUaZVFKBoLthRpHNRnpqjYh+8ngfGgiWwQczjChZqCzffw/
         6suBurxjUv2t7gSPms9YASIW7UwpGoLykfWb2aaznRVOY8tCKipWd5mdnqWRpg/kyBOB
         KCq4u5pw27VSgXx01OFBUsWcvrL0NWrVANK8Q1fFv7Bf/YCip6pNvNog2DNCCZqHVro3
         8t9qQkNA9e3XmrsnpSfVD2f+qYpbpfVzbYg7q3vGEosAFW7LH53R6JjonJO35SarHmYT
         ubT6weCg+JhkBQcPy0jQ7RivbK+ZW2okReqdOwn687RK60dJMi3bVwBvQmsN9zHC9vjO
         aKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730359; x=1783335159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eUhmGJbv6k1XDbgbJ9s2sfVkkEIVefNbG9jVOo4wYIw=;
        b=dNH+OUIli8GSAGuNZvsTEP7NjQtZuPbdmIDrzZtQkys2inN4fswq3gAlNO0zUGdhPT
         +XlM9uRsBSH47NJ4KCRG73V4SugpwlkTaF0A4SN2Y347eVXdWWvIyP3VrqJ6lHIeZoZj
         Si8Lnd6wKvueFav9NLswRlD0rMP4EyUw0bejpGNfDM3voTutq8knPyuwCG8cZbMqhqoG
         e9iProaGFjN1sC65DWoVQM2/IIP4MhhUbdlyxlDDVq457NGaKGN3598fZN51LZpmlUHM
         7IlNULBDl/YvA+96W4zTB5GoTYvODaOLIKn7R+hvhz+1PRuIyfLUGTUtfX/bQ0QCtcgC
         AY4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+a7j9iJiKBv7p1IBlqNBv+fpbn4KOnmCxFrxeqZCW9VVHbGd7tTu5tROPDIHzhjBTyXSkMSguEgmM/9ZtY6NA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PnU3o8jLYXiZPQpeWQOeH+CPRsy+5QXdVNxvsrOGzpOhjz5Y
	PLdTetUNHpHXtrhtbEZ1ykIPfYdzI0RVY+fEGfWxSHzcwoOLwl25/7B1uL9B0+cppCrtevGV/+o
	wfoDBXbRdirmi/Dy/iW38tK3oPT3yYB9V4pfUtySOieK6nbyc5ZxVxel+jNILXwi47mvsiUc=
X-Gm-Gg: AfdE7ckPvoGS7+DdbsquWFPs90vBugt5pPF3fbn0Vd678cqPZL3JVi0OKHUPKuxKmJX
	Nku7CTlkePwK40Mw0xlWeF8LRXFSY+g2aq1+1+fosLy7CPkFyaumld8v8/5jkdABAki6VTKpR2c
	9s4sF/2IvJ3NgT5ny1KGHqhGkXZ4FqNEtoA+m3mV12t4zJWuVXioP7cZPo931IKFBbXdGW48xVV
	5Ycu9qu0JRC/n8//PYqNr7UCJifDlx3fVFpp+jiCUiOAm9qxT0goxn1YraNwzif+Z1j6A1q4Nwj
	1eNt/h8A+HfeLAU6WCQrL0dHywJlczQurROJKNK88wm1k+i72l8FZOxHQ5qv7n7s9QQ77ga4t8d
	vgNAqSlL6OECVlfMMVc1DpvkP+wg4x3w1jehv1YGT
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373503285a.54.1782730359511;
        Mon, 29 Jun 2026 03:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2373499085a.54.1782730358805;
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:07 +0200
Subject: [PATCH 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-2-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5901;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaiJLexiF98y8XcMe93LaDHZUMWvIUjsVpeVPy2+qgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5t0Y9gDbRacLGA38+hEuDqKZaDGylsWKnXO
 jty9JT45GyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObQAKCRAFnS7L/zaE
 w7uFD/0dTneqZ2cF0h8mSLdekIQ/jforMnCahzb5haC6IBoks/HERg9gKPMxr47I2RsPVJ7EDVM
 Hoib9K7MhaLH1ssXUnzGxzU0t1EMHsuRtCN8tSdU2IuatwKVMOx2zDirAlmWxkzSQcxavkC7Ahx
 e+8n1DLlKhh86o/5/Fi8axWIlgA+Dudef8ISacUz5pAvqH6zt/roj0xGWvfU5BZxkltg+M66yer
 Nln3PG8p2DyQT0yGZuT2fIUharosrL9b1JJt5s88QLhZAYpUTw2XXJ/o74Ap/xWxUecgX+qt7bJ
 FWFDUsh688jD4rEBuIBkRDPXZ3B4C7PtvqNE+9X5ZAhEqzF6Vy2GBclxYelrom/cl2j9XZANLpK
 ulae2sg4T4JHrCCCW4HQx4RNTe+NbEBKRjoT4mDAqPaZ9KzFMOyJGH72y/YlFtnY9ad/+x30oQi
 xkB69uuRhijx4LqFTY+Z4homeXD/mjMENJEkqXUPDhZ5dJ6yi/m3xr9bIpCP4SvoKwtJJs1K0lF
 1R2lcIHbpjH3LClw2tfnx/Bh3s/kCLBNzrmK8Lk4l7LFA3Q0J/j/iqqIrD0+mB/8ecnCSd62QQ3
 5nRaC5cA9KISwqiIYPRMoSuaSj/A1WQwlgc+vcCU6XrmBnQlURX9wycpSW93N31yN0WVU+w0R2r
 e6bu2CsS6ySlHdw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX8gmHRMeHBlbI
 VTRG1a9hx4pWi0OYBOQxz9InYZn4cz8L50ysJullgLA4O0wgGi/HBIa/IjxwS2erMctoK/QQd99
 FC6YKP62AbycTTQ7zQZB39iCtykJWpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfXwAmk+z1GYuP+
 zWItZcQeTh47YqcGi+mJUtTrigg+nYyC+ATDCu9OVVYOmndQDYcgi0TPRsYpGIsHupxozd+FhQz
 v83Uu/4AXC+Oa7TCPXAw2SGzNp+HJONVrBBHGhsK80tsYdOcuhBU+1Bmuq/CW+oMHpQ7zMJPVgA
 Wu5T7rSpMtM0hoW1mJ/mg7I49rSeCh4uadwOdVYw8sB2b1H1DT/zrFK6v4VAJT647NFUeJTOVsJ
 F7nHRDcjJaAxn5fSFW5dO4fXQeIdtG4DT+hwoytGZj3XOlt3M/aoBpDyFLGOywi3t7zHuAiAlW6
 albTUXqZhmtUl7da3XUJ5cfqkeTeUeV4YbTaSxwbfQKLf5LWymusL6HLv8WUmdbEPF2g4zuqa0b
 zOzu8c6yrKK2uIo9Ia2Ap2km2/Fuy6/uEOETV+6ySHA5EjOPErBSof5BwIJ+lRTbRv2EsYwWxEs
 WTUbCS/5g0egkcaM7wg==
X-Proofpoint-ORIG-GUID: 0AdauABNhpY97oF-OVkh57gmUtb6bMBj
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a424e78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hYae1UF5it2L3rE2BuUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0AdauABNhpY97oF-OVkh57gmUtb6bMBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

Software nodes can be used to describe supplier-consumer relationships
between devices they represent using reference property entries. Unlike
for OF-nodes, driver core cannot yet use these references to create a
probe order that avoids needless probe deferrals on missing providers.

Implement software_node_add_links() modelled on of_fwnode_add_links().
For every DEV_PROP_REF property we resolve each referenced supplier and
create an fwnode link from the node to it. The driver core later promotes
these to device links and defers the consumer until the suppliers are
ready.

There's no allowlist like the one DT needs - devicetree phandles appear
in plenty of non-supplier contexts, but a software node only carries a
reference property when its author explicitly points at another node, so
we treat every reference as an intentional supplier dependency and link
all of them. Graph "remote-endpoint" references are skipped for now: they
go 2-ways between endpoint nodes and would create graph cycles without
the port-parent lifting DT does via get_con_dev(). References to
suppliers that aren't registered yet and self-references are ignored.

fw_devlink resolves the supplier device through fwnode->dev but the core
only records the owning device on the primary fwnode. When the software
node is a device's secondary fwnode, mirror the device pointer onto it in
software_node_notify() so the consumer can actually find the supplier
instead of deferring forever.

While at it: purge the fwnode links in software_node_release() now that
software nodes can own them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..48eb67826f9e1917acc7a6a513c1536a7ece0961 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -699,6 +699,62 @@ software_node_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int software_node_add_links(struct fwnode_handle *fwnode)
+{
+	const struct software_node_ref_args *ref, *ref_array;
+	struct swnode *swnode = to_swnode(fwnode);
+	const struct property_entry *prop;
+	struct fwnode_handle *refnode;
+	unsigned int count, i;
+
+	if (!swnode || !swnode->node->properties)
+		return 0;
+
+	/*
+	 * Unlike Device Tree, where phandles appear in many non-supplier
+	 * contexts and a curated allowlist is required, a software node only
+	 * carries a DEV_PROP_REF property when the author explicitly describes
+	 * a reference to another node. Every such reference is therefore an
+	 * intentional supplier dependency, so we create fwnode links for all
+	 * of them.
+	 */
+	for (prop = swnode->node->properties; prop->name; prop++) {
+		if (prop->type != DEV_PROP_REF || prop->is_inline)
+			continue;
+
+		/*
+		 * TODO: Graph "remote-endpoint" references go both ways
+		 * between endpoint child nodes and would create endpoint
+		 * cycles. Let's leave it out for now until we have potential
+		 * users.
+		 */
+		if (!strcmp(prop->name, "remote-endpoint"))
+			continue;
+
+		ref_array = prop->pointer;
+		count = prop->length / sizeof(*ref_array);
+
+		for (i = 0; i < count; i++) {
+			ref = &ref_array[i];
+
+			if (ref->swnode)
+				refnode = software_node_fwnode(ref->swnode);
+			else if (ref->fwnode)
+				refnode = ref->fwnode;
+			else
+				continue;
+
+			/* Supplier not registered yet, or self-reference. */
+			if (!refnode || refnode == &swnode->fwnode)
+				continue;
+
+			fwnode_link_add(&swnode->fwnode, refnode, 0);
+		}
+	}
+
+	return 0;
+}
+
 static const struct fwnode_operations software_node_ops = {
 	.get = software_node_get,
 	.put = software_node_put,
@@ -716,6 +772,7 @@ static const struct fwnode_operations software_node_ops = {
 	.graph_get_remote_endpoint = software_node_graph_get_remote_endpoint,
 	.graph_get_port_parent = software_node_graph_get_port_parent,
 	.graph_parse_endpoint = software_node_graph_parse_endpoint,
+	.add_links = software_node_add_links,
 };
 
 /* -------------------------------------------------------------------------- */
@@ -787,6 +844,8 @@ static void software_node_release(struct kobject *kobj)
 {
 	struct swnode *swnode = kobj_to_swnode(kobj);
 
+	fwnode_links_purge(&swnode->fwnode);
+
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
@@ -1105,6 +1164,17 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
+	/*
+	 * When the software node is the device's secondary firmware node, the
+	 * core only records the owning device on the primary fwnode (see
+	 * device_add()). fw_devlink resolves a supplier device through
+	 * fwnode->dev, so without this a consumer referencing the software
+	 * node could never find the supplier device and would defer forever.
+	 * Make fwnode.dev point to its owner in that case.
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && !swnode->fwnode.dev)
+		swnode->fwnode.dev = dev;
+
 	swnode_get(swnode);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
@@ -1127,6 +1197,15 @@ void software_node_notify_remove(struct device *dev)
 
 	sysfs_remove_link(&swnode->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "software_node");
+
+	/*
+	 * Drop the device pointer mirrored onto a secondary software node in
+	 * software_node_notify(). For a primary software node the core owns
+	 * fwnode->dev and clears it in device_del().
+	 */
+	if (dev_fwnode(dev) != &swnode->fwnode && swnode->fwnode.dev == dev)
+		swnode->fwnode.dev = NULL;
+
 	swnode_put(swnode);
 
 	if (swnode->managed) {

-- 
2.47.3

