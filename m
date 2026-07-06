Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C1C4314B6
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342482; cv=none; b=JGPFbBhGg7EQFazXZkUMH3//FwxwrUOhZTPlwnmvqBi04MNRHnuQ3KHb9y5ErqG6I5oc3Rp423FXRwVSmC7yppdB5RXaytMmwOv8Xc2Gl9M4jinE4o3Fu8r4Mbra4A0GCbeRHqxSNK11b1nRVlMDXkW5CKoOCAjaflova8O3wwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342482; c=relaxed/simple;
	bh=GJDbWtXj9ZhW6DQ5CNbSiVpJMnaQQHbolc9yo4vLUbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYHOL6j/cDwlwBFyoWQCX8HrAOPbz1yUw9HnRsfkwnK/M3//BwHoygus5xaFKyWbFmSMo853M/wH2nBUuJLRRrvi+15/A/fFCuxLLUduCMGdCSSa2aGiVBxQIwT/porcCFRyulWT9VG5Arcg2kzhPRUuBIKoRle/L2db7IzOUXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcsl5Tz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrYF7Nro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcsl5Tz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrYF7Nro"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxMtP218465
	for <linux-kselftest@vger.kernel.org>; Mon, 6 Jul 2026 12:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=; b=pcsl5Tz6FuYmQbGZ
	Pl/grkG3dT3L/nTpSIP/3zLMQFZYBWOqNipoMr+DJF/0HpEW4uaqWzASEb4eEAf0
	TMn7i1M2soi7s+TAkXkooMbKD9KiZZNskndghhE97G2HAEWpYMU6OPVf0GslQe2l
	neAHpSX8Li7mUMecrWVkfKCrUVcm2YKp3Mq+wATu1SINekC88OjUbAtdy2uVFUdG
	gVflQaU4l+Lj4j4mSR10htUjXPWHBL/ie6vMcDSAgWO46I60qx/TbDOepsfL/MrO
	scX7iGXfoWhLEriweQuAZuXPCGL5kJgWrmKiV9glO9hti6m+j8JdufNkGwq7cduA
	JsNHVw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs94m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 12:54:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso555011185a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342479; x=1783947279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=;
        b=IrYF7NroXH6LljVQijhS2RMdo9Azys/FJt9qoCJbvXPx4Ly7voN51K4UlNyqgbEZfZ
         FkWFbu1mdCmqLPMq8dMDJ41sHFBfXJs7ELXUu5hWL9uAMghHQSHVESkr5gaBIHmvOZHY
         Es1XB5MiBE9HkGKSn2H8lkKQP16j4TVhybpcH+x/mAhk0+5T+HU3Q5APTi2Y+KH9B8C4
         8qIdRlaW1R0d4u+CIMWt7bemafiPS8tZ8qNsTaRCZTdNYpB03YVnfdd/KwuE8rcgisdb
         cUgLQnbjwg2R+6BMvPlqpjUB87BlmqMc97q5EdhbIXP0zNjgJydUOBoIi6Sg1n+Tys+w
         3Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342479; x=1783947279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xwH0Bx09wM7eaw/9z1uR1vS8Ka921p7XRleHkZMrv4=;
        b=QkSYy7Da2A87VSAETfEJ+TO97dUlYQPzmjMIdWPOyf+hMMSFihJcIxw5mPJq7HvAMN
         8CtRqLXsVQKBacs/QMxdRFmITcMOOsbC/QhTa+D18o/iEk+qI6YvhKJtXPhXmvXIOS98
         SbWLDZVueT+ZfJWr/Gn7gO8pq9t/Uy49zW7TVXigewi6rpXa5AhS9rUq/npGZk+HvWHG
         Pms8zPfUyrt2l04WxJH514NbNLj2dGMH8rCRc8GL4bpte8ULtWUJ2UOZcF5CLO6XUjku
         7JOjtyrQhOGGuLC80MRzUWenaL5nflW6b0CBOsXHYFTUdpO0o2TP2Lsv3/D+tAW+ffhS
         WYOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe0qSdxtYnJvRxVX+bNvzZPL7sEN9bKqma+RwamHGTEpDseJCHHvde2Riw47X4y9MPDif8VRl6foRXZO/4UMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq70dcYUGOOLzKsnjEuTBlJkr53y0ztcsgEzosFOirLkTdm7az
	gITkSiDMHgoSpQVYIHKbzNGegm63UdUZF7YJawWL4xnJY4cMdzeF+ngqm7YVhvZh7Eo/4ChapFp
	WipGnhHOmPpMvrsrRQoVzKMiOIW3akzEJUPBYtCNlHhItEwcbRg0mpgMxTdZHSHltVpD1Ac4=
X-Gm-Gg: AfdE7clne1Zax7ezomGa6MeZzw6ITT5dUAzGMAADLdFzcSBF1mC5Zvx+8aBHOKKheod
	8Dhlkn4b2tIIUhLpkgAKrnn3brbG9KJOfpUyfbUj/GefL6tlaqoMEtkUkdlF3KXpf9Z6U254Icl
	bk24AYvguwWwRv8C133KDh2vfNRRR3Gt/SDUeWNRc1EpHawFLMVElXphsEmImpxl2KuxLbhlnAV
	Pqf2ER2e6QSmL87EhfV5C3p/RFJBEUVf5v5jRmGQXGbhyDsNxuy9FOJ0owTKlVQeTrfrBWQdcpa
	WUuzI1FL5zHWoyPZC4K7wxhmlry4fdP7SnjcSH5OkLGOCaGUegR4ADwn733Q7vH9OO2PozalT4I
	YHRxG4QZFSAqkR5GnYn4AZadtB0HFfgYWw4igF0Wj
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr59039785a.63.1783342478596;
        Mon, 06 Jul 2026 05:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:45ab:b0:92b:6805:91b7 with SMTP id af79cd13be357-92ebb5ab797mr59035485a.63.1783342478103;
        Mon, 06 Jul 2026 05:54:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:09 +0200
Subject: [PATCH v2 2/5] software node: add fw_devlink support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-2-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5911;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GJDbWtXj9ZhW6DQ5CNbSiVpJMnaQQHbolc9yo4vLUbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WDdtOFStOHjpQkjs/j5JIUJEmU1M2ZH4qNl
 x4Dl6VOcZSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulgwAKCRAFnS7L/zaE
 w/d6D/wJSATxv4K5AL6hRe3ClxpHbG6tS5ckmZr0niulBSKvlPfKJYnF0sPpAX0DgnPtolRsNj8
 R/O1VeIrJcWDjiFoPtimC+hgXpdKBy1++MtipDSVxov507nwH2YrndmqBtLcg7z6ltYLECa09s8
 C9w93sQfnDLn70Z72BJkcRM4LRkwuigfAkL7n2bLyWor8OC8j+C7AB6DaEDSX/jZUR3PnS7QbyW
 W53hVVs/AUrMhSM/7nGuMNKAQXnanKmYvu82bWiCSCso77dqat84XxKEToxMYScMAawyKbMeSnp
 41Nz1Ll9R/bucdoSCnc9YfZEMHYSUq9/6kvw6iYt8Fn9e9y8Egwe+RsbUMoSdiMOHXenPKgD3A2
 80RzgYjazty+vV99UJtImIoRZTM2yfY6NvL3eJlOeGY1SQRDkBIkOU7FJ+xYeuRJRPjGhn6Yh9o
 E+KBW5yjGmzkf1YyxoY1agg5TovE5X2bFX+wPlkiRPS0ukqB61lBpC4qxcdSy6y0r0fPUDYiPkN
 VEkwIfkJKOMIgTNO4aWKkvk6541vq+pPiF27fwJE2tEKPz7exsgtNmZFD2ODXmUxzpsgi9zZ6F+
 ic9GGG2AfYfLO4inIICa1Y3OCxfCoY7SzyyDElCV54FZEF1Jg+GERo3uIqpPQ/Gg6+NWi11KBIe
 Y5eW+c9T9rMELCg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: onamsj6Knnz-xMI6Qzs-_RoJHepgwBmH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXySL6Emr7bC79
 CLmHPIXX/vhBGtBWo6o3Meyxmh0kqZCeVHfwZynHVa/F2jPU19KXHO1eNlEyw7nPhD2qTFXffku
 gsy1W26S5DJZp098OWXRdutuYEBM3TFR+1Enhbvz7H1u72qT+aKGXaqZ3vMfO0xvfOBT60LBSQu
 6XdjOSN7QNpCLCpPA8asrPnFi8MnPgbsaoTWl5JDojE6EMdUBG01IS8aMRXXSAdGeErGGAWBus6
 QZtsyJEa4YoS5DcWjD7yA9i0uG1mMtNeHUycvrSVhYze/Ktn1ivMgVHMU2Fa1e/yhA2Un7ksPmc
 dqXqw080Wq1qPjegJKGxArTgaLXfIa9IP7EB0OR6AAqDJI4scaxtsrWT0DT9uboJtd2B+BypsnC
 4kYVewpa/QCYWlqZcQHP+T8o3KmtkSPGO9H94lKYvIOR2UrrH7aKUvZ67Z/EJfBhexsRlAUARwP
 C3XkOYUwqofGLJV84dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX1aMxfmwrcLig
 md7Lgnw3EhU0ms5168nwFfz/ZTv97lN5COnIlyJoNxMsh9URk/MIxqzgQtO25sC/uc3dUd/5SWd
 8fwpq/fLw51pCy5NK2qekIqY58r++uw=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba58f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fLzRGSmVK1lo7flavS8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: onamsj6Knnz-xMI6Qzs-_RoJHepgwBmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

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
index 869228a65cb365567ddac7db6ad7b8743e0dbca9..e6e2d6926fef2db82eb1f2bf439e80aacf48668a 100644
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
+	unsigned int count;
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
+		for (unsigned int i = 0; i < count; i++) {
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
+	 * When the software node is the device's secondary firmware node,
+	 * the core only records the owning device on the primary fwnode
+	 * (see device_add()). fw_devlink resolves a supplier device through
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

