Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C4377ECC
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142969; cv=pass; b=C1e0VIrnv8364KcfZYEZNeGxPN485oO7KQ0viiMQsq1JXfII5jSHzNRLFDAjr+Fgs2wIt9ook/y7Cemsd3GahfP5nvaoLhWvcVxWmH6vLrMLvtpn6C5aZnhUFMl+sbYdRsypq0xjRkuShZwIn+xuNTIzmkf9VdoL4K61ZJyFC4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142969; c=relaxed/simple;
	bh=RJxpkATgLBU/u1tO9tMF9UGpnmlllsMGsyAtf0uwiQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOygcEN/5h9odDPNqkd/pVCm1CHAr2bAsRGBBIJDmWgg9qfWrnRf42axvqwiQWSajiLKVMdOH8eRIJUz7HLhaxidPkOnx6dj5Bae8M13BS3qA72BK3m7WCrtJwF1B4drwmyvZ4DR3Nh7dTwmZtgW8VNbGiXK1ND2reRvGdWE/yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CaSf0585; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CaSf0585"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso2727266a34.1
        for <linux-kselftest@vger.kernel.org>; Sun, 30 Aug 2026 19:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788142954; cv=none;
        d=google.com; s=arc-20260327;
        b=YiDo2j9YHt5Z+/uA7JVLGULsZ+xYmPHTBRDaOjOQLb1ykghq1OjfL6vsb3gMYWGtTb
         KfHiUE89zASz7vKaqurgMYPt8/N/6VmS2t1c7Q7CjN0AorWvFJOBrLDKcQuoCCXz+cjt
         KJznpMG34YBz7gGfqg4hDyt9ZvB1P1sXcWp8jESZQf2n0YHH/55HVYAj8qeTtBjyRTTv
         mmCAWTQk6YzbL1Du37qhFgvh/5LORtwSsIlF3ln7lbobpfTySEDhjawVhDD2LUUAyPaq
         Kvg+Beb2ISM/9UjMNKtsnHokM+sS591McvUxrvGczL6lsUuddvRTPbXvbt1a4HwhtATz
         LEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ipOguuWwal65r/1u4oSzUlBPvWWg7WVDAuJhTjQTFug=;
        fh=u6oxeS9tSJ+ShxJ/kMy/C7q/geOBnmjRZSd2MuSzQpg=;
        b=HU3Sh1Gm8ansyqjHfV/GBSfHPzXJSMEMGXYCBVr/7Ad/kszdbZRyjnWHYM4aoK3d5w
         GZbCjemIdC9T3G2n3TbqotSatUcrXVOPDzSS1rppzhdcHwySZydoJfrE3JFe1qI2M9SU
         0TMl1b/zWrcWFwnA9OKqDjZneXLZqH5K1DCs/wZuydcaVvp7nkcH3pq/Hf7EIgZCeLje
         ZchV7wqDN/A8MHX7TgHQkKOLifE5m3Kb18+0o+Tskh+OUFs7vXO9ji5kNE2CXAbP3/Ep
         ShFDyHzC5M1zix9mnE0NqCsNMmgPK50md5xQgbE1iLbhPxlPV8zy4IQ9xVGZSEeDZNIF
         x+0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788142954; x=1788747754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipOguuWwal65r/1u4oSzUlBPvWWg7WVDAuJhTjQTFug=;
        b=CaSf0585BSnvukl25BOgo2deyLClWLzkHGljpDaKhr6YUlTJVpEd4bcraMQe8rHjcD
         YkHkPDlJ1PoE0Gd5yuG+MBZyN3E2LDJQlVH74Hl7jiLGVhAgJvy0Vsqc+CZRVcvEVpfA
         vBB2KLQivJJ409je0+KYIrflrDLMHHzhVSejmBCvVUY1ACzIH+44oOYgL1p7bMOOR7AZ
         46Cu8aB+RBOl4117IwjiNEBbEgXyenBVxD0H33Bo0rU6UkIDJ+B0BcYW7ZDspsHolfdN
         7MQSm7vc+KJuur8E/F61c2rK7sgDHfj5nVO3EvqWvQFNc8IgLFFvR/4/feyCs2xyUGOu
         aeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142954; x=1788747754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipOguuWwal65r/1u4oSzUlBPvWWg7WVDAuJhTjQTFug=;
        b=gyUDudgf559bNQpkzxZWNKcUaqv5ovfn3eb3IKcJpXckfG+DQRuh3gzDxwkWUI41hN
         HOZZ1ZIBNi+qm7PpXw8rXnnK9xSHPkiyaX8e8MNj+DB64SVAqkXtTi1KqcF3rxbfoKRk
         VKwJe3TGl1FSLHUc5dbwB7SpwWQlFBXYno70pfcGOEwZ/CKRrq1NSNbUT7OM7Q6boB/n
         S9ZiXPk+5aap7tlgXjUIgtqo9qv1qBcQv7eo03c54SNGrbA3btJ3skNzraVRT+lM9vek
         3GIvF0R87LXoo2kMDUqh53et0P5fgMQiwixRI3aRIJ35zvVF6jpdIbdUrIsQIwJMRorJ
         0Vhw==
X-Forwarded-Encrypted: i=1; AHgh+RoicNr8GVP8b7XQLQ9HqW8XYbAJBuThPD4oTKEmWLaoqSbqWX8KwXtWBcJa44GoGQAjH3W45Uha3np1LJun7HM=@vger.kernel.org
X-Gm-Message-State: AFuF++kNxGtsbEsPBYxOts1/McfAIsHU+pklErbcE4KOIg8Thvodfawt
	hr1L/m3MTE6MbpCcFD/HIQnUw4JCyDc/1BV17w4CVbVzByc/jQl+/5X/b0HmV3h6tp4YuklCsMs
	QJtUo+L2tDmxDJkQMYoRuEwCtkKPCxFromeWc3Q3dvQ==
X-Gm-Gg: AR+sD13PjkQxRmVOnNyOVHU0i+xppMoQ5tpjnQn+l5YHziymNbSxPF3CGWQZSTF3tJX
	TcxW7nJb2cApgWZUpOfOVem00/DA5NWslnGlbOmO8NCjv8N8xvoMsTNdGUwE5+BW0p1do0YAPl/
	UQa1ol4E8BWStbSZ63K/Ggob690uV/LVBei+NQfe1jbn6Hv6t8TrdxZou+H+6R4C5DJ4sXNkP4L
	uBryFH/LRRwqBX5CG/R/8fXh4BvirsojG6rysh7LYxQ6FCIV7l5xx5/UZD36prsHorosdzfA0t3
	cMu9s5pCFIreAyOBWitd8AD6yJ+WhECxBSHFfqN47h1+sCzmc7EGjzaZj3gweSw=
X-Received: by 2002:a05:6808:23c9:b0:495:fd9b:1808 with SMTP id
 5614622812f47-4b398017060mr25722777b6e.8.1788142953747; Sun, 30 Aug 2026
 19:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com> <20260714130657.46963-7-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260714130657.46963-7-zhangzhanpeng.jasper@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 31 Aug 2026 10:22:22 +0800
X-Gm-Features: AcwNN1VHNaLflYI-HVMoCotiDIU95Gw4KdfrwenubXhIi3zixKqADa4c1CPSbdY
Message-ID: <CAEEQ3wkxJYK2K602yjcaKPir9Tcb73ML--shpG2CrOm8geLNjg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] riscv_cbqri: Assign IOMMU groups to resource groups
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, fustini@kernel.org, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, Dave.Martin@arm.com, 
	james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, shuah@kernel.org, 
	jgg@ziepe.ca, kevin.tian@intel.com, yuanzhu@bytedance.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhanpeng,

On Tue, Jul 14, 2026 at 9:08=E2=80=AFPM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Allow the resctrl devices file to accept iommu_group:<id> tokens on
> RISC-V and map the target resource group's closid and rmid values to
> RCID and MCID.
>
> Record non-default assignments in an RCU-protected binding list rather
> than inferring membership from hardware IDs, which may be shared. Keep a
> parent reference obtained by numeric group lookup so the binding does not
> keep an empty group's devices kobject active, and prune bindings after
> their group becomes inactive.
>
> Publish an explicit UPDATING state while hardware changes. Paging-domain
> attachment rejects that transient state. Static FSC=3DBare transitions
> preserve the current IDs so a mandatory release-domain attachment cannot
> fail. After the checked group update succeeds, publish the packed IDs. A
> validation failure restores the previous active state without partially
> changing hardware.
>
> Moving an IOMMU group to the default resource group resets its hardware
> state and removes the software binding. Device contexts created later for
> an assigned group inherit the IDs through the RCU lookup path.
>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  MAINTAINERS                   |   1 +
>  arch/riscv/include/asm/qos.h  |  12 ++
>  drivers/iommu/riscv/iommu.c   |  70 +++++++--
>  drivers/iommu/riscv/iommu.h   |  16 +-
>  drivers/resctrl/Kconfig       |   6 +
>  drivers/resctrl/Makefile      |   1 +
>  drivers/resctrl/cbqri_iommu.c | 276 ++++++++++++++++++++++++++++++++++
>  7 files changed, 369 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/resctrl/cbqri_iommu.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c59be02c8f02..162ad5a1780f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23288,6 +23288,7 @@ L:      iommu@lists.linux.dev
>  L:     linux-riscv@lists.infradead.org
>  S:     Maintained
>  F:     Documentation/ABI/testing/sysfs-class-iommu-riscv-iommu
> +F:     drivers/resctrl/cbqri_iommu.c
>
>  RISC-V MICROCHIP SUPPORT
>  M:     Conor Dooley <conor.dooley@microchip.com>
> diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> index daa758d4efff..84a93739c6ff 100644
> --- a/arch/riscv/include/asm/qos.h
> +++ b/arch/riscv/include/asm/qos.h
> @@ -8,6 +8,18 @@
>
>  struct iommu_group;
>
> +#ifdef CONFIG_RISCV_CBQRI_IOMMU
> +int riscv_resctrl_iommu_group_get_qosid(struct iommu_group *group,
> +                                       u32 *rcid, u32 *mcid);
> +#else
> +static inline int
> +riscv_resctrl_iommu_group_get_qosid(struct iommu_group *group, u32 *rcid=
,
> +                                   u32 *mcid)
> +{
> +       return -ENOENT;
> +}
> +#endif
> +
>  #ifdef CONFIG_RISCV_IOMMU
>  int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid,
>                                 u32 mcid);
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index e85da9eef58e..1a7d8a582959 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1188,16 +1188,50 @@ static void riscv_iommu_iodir_iotinval(struct ris=
cv_iommu_device *iommu,
>   * device is not quiesced might be disruptive, potentially causing
>   * interim translation faults.
>   */
> -static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> -                                    struct device *dev, u64 fsc, u64 ta)
> +static int riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> +                                   struct device *dev, u64 fsc, u64 ta)
>  {
>         struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>         struct riscv_iommu_dc *dc;
>         struct riscv_iommu_command cmd;
>         bool sync_required =3D false;
> +       u64 group_qos_ta =3D 0;
> +       bool has_group_qos;
> +       u32 group_rcid;
> +       u32 group_mcid;
>         u64 tc;
> +       int ret =3D 0;
> +       int qos_ret;
>         int i;
>
> +       /* Serialize DC.ta updates with resctrl IOMMU group QoS changes. =
*/
> +       mutex_lock(&iommu->qosid_lock);
> +
> +       qos_ret =3D riscv_resctrl_iommu_group_get_qosid(dev->iommu_group,
> +                                                     &group_rcid, &group=
_mcid);
> +       if (qos_ret =3D=3D -EAGAIN) {
> +               /* Static domain transitions must not fail during device =
release. */
> +               if (fsc !=3D RISCV_IOMMU_FSC_BARE) {
> +                       ret =3D -EBUSY;
> +                       goto unlock;
> +               }
> +               qos_ret =3D -ENOENT;
> +       }
> +       has_group_qos =3D !qos_ret;
> +       if (has_group_qos) {
> +               if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID) ||
> +                   iommu->ddt_mode <=3D RISCV_IOMMU_DDTP_IOMMU_MODE_BARE=
) {
> +                       ret =3D -EOPNOTSUPP;
> +                       goto unlock;
> +               }
> +               if (group_rcid > FIELD_MAX(RISCV_IOMMU_DC_TA_RCID) ||
> +                   group_mcid > FIELD_MAX(RISCV_IOMMU_DC_TA_MCID)) {
> +                       ret =3D -ERANGE;
> +                       goto unlock;
> +               }
> +               group_qos_ta =3D riscv_iommu_qosid_ta(group_rcid, group_m=
cid);
> +       }
> +
>         for (i =3D 0; i < fwspec->num_ids; i++) {
>                 dc =3D riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>                 tc =3D READ_ONCE(dc->tc);
> @@ -1233,11 +1267,12 @@ static void riscv_iommu_iodir_update(struct riscv=
_iommu_device *iommu,
>                 tc =3D READ_ONCE(dc->tc);
>                 dc_ta =3D ta;
>                 if (iommu->caps & RISCV_IOMMU_CAPABILITIES_QOSID) {
> -                       dc_ta |=3D READ_ONCE(dc->ta) &
> -                                (RISCV_IOMMU_DC_TA_RCID |
> -                                 RISCV_IOMMU_DC_TA_MCID);
> -                       ta_mask |=3D RISCV_IOMMU_DC_TA_RCID |
> -                                  RISCV_IOMMU_DC_TA_MCID;
> +                       if (has_group_qos)
> +                               dc_ta |=3D group_qos_ta;
> +                       else
> +                               dc_ta |=3D READ_ONCE(dc->ta) &
> +                                        RISCV_IOMMU_DC_TA_QOSID;
> +                       ta_mask |=3D RISCV_IOMMU_DC_TA_QOSID;
>                 }
>                 tc |=3D dc_ta & RISCV_IOMMU_DC_TC_V;
>
> @@ -1259,6 +1294,9 @@ static void riscv_iommu_iodir_update(struct riscv_i=
ommu_device *iommu,
>         }
>
>         riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
> +unlock:
> +       mutex_unlock(&iommu->qosid_lock);
> +       return ret;
>  }
>
>  /*
> @@ -1324,6 +1362,7 @@ static int riscv_iommu_attach_paging_domain(struct =
iommu_domain *iommu_domain,
>         struct riscv_iommu_info *info =3D dev_iommu_priv_get(dev);
>         struct pt_iommu_riscv_64_hw_info pt_info;
>         u64 fsc, ta;
> +       int ret;
>
>         pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>
> @@ -1338,7 +1377,11 @@ static int riscv_iommu_attach_paging_domain(struct=
 iommu_domain *iommu_domain,
>         if (riscv_iommu_bond_link(domain, dev))
>                 return -ENOMEM;
>
> -       riscv_iommu_iodir_update(iommu, dev, fsc, ta);
> +       ret =3D riscv_iommu_iodir_update(iommu, dev, fsc, ta);
> +       if (ret) {
> +               riscv_iommu_bond_unlink(domain, dev);
> +               return ret;
> +       }
>         riscv_iommu_bond_unlink(info->domain, dev);
>         info->domain =3D domain;
>
> @@ -1413,9 +1456,12 @@ static int riscv_iommu_attach_blocking_domain(stru=
ct iommu_domain *iommu_domain,
>  {
>         struct riscv_iommu_device *iommu =3D dev_to_iommu(dev);
>         struct riscv_iommu_info *info =3D dev_iommu_priv_get(dev);
> +       int ret;
>
>         /* Make device context invalid, translation requests will fault w=
/ #258 */
> -       riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
> +       ret =3D riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE=
, 0);
> +       if (ret)
> +               return ret;
>         riscv_iommu_bond_unlink(info->domain, dev);
>         info->domain =3D NULL;
>
> @@ -1435,8 +1481,12 @@ static int riscv_iommu_attach_identity_domain(stru=
ct iommu_domain *iommu_domain,
>  {
>         struct riscv_iommu_device *iommu =3D dev_to_iommu(dev);
>         struct riscv_iommu_info *info =3D dev_iommu_priv_get(dev);
> +       u64 ta =3D RISCV_IOMMU_PC_TA_V;
> +       int ret;
>
> -       riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_=
IOMMU_PC_TA_V);
> +       ret =3D riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE=
, ta);
> +       if (ret)
> +               return ret;
>         riscv_iommu_bond_unlink(info->domain, dev);
>         info->domain =3D NULL;
>
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 13ea67b7e42d..e7804ec65647 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -11,13 +11,11 @@
>  #ifndef _RISCV_IOMMU_H_
>  #define _RISCV_IOMMU_H_
>
> +#include <linux/errno.h>
>  #include <linux/iommu.h>
>  #include <linux/iopoll.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> -#ifdef CONFIG_RISCV_IOMMU_32BIT
> -#include <linux/spinlock.h>
> -#endif
>
>  #include "iommu-bits.h"
>
> @@ -26,6 +24,18 @@ struct riscv_iommu_device;
>  int riscv_iommu_group_set_qosid(struct iommu_group *group, u32 rcid,
>                                 u32 mcid);
>
> +#ifdef CONFIG_RISCV_CBQRI_IOMMU
> +int riscv_resctrl_iommu_group_get_qosid(struct iommu_group *group,
> +                                       u32 *rcid, u32 *mcid);
> +#else
> +static inline int
> +riscv_resctrl_iommu_group_get_qosid(struct iommu_group *group, u32 *rcid=
,
> +                                   u32 *mcid)
> +{
> +       return -ENOENT;
> +}
> +#endif
> +
>  struct riscv_iommu_queue {
>         atomic_t prod;                          /* unbounded producer all=
ocation index */
>         atomic_t head;                          /* unbounded shadow ring =
buffer consumer index */
> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
> index b7db6ff9d054..4e10c813e647 100644
> --- a/drivers/resctrl/Kconfig
> +++ b/drivers/resctrl/Kconfig
> @@ -60,3 +60,9 @@ endif
>  config RISCV_CBQRI_RESCTRL_FS
>         bool
>         default y if RISCV_CBQRI && RESCTRL_FS
> +
> +config RISCV_CBQRI_IOMMU
> +       bool
> +       depends on RISCV_CBQRI_RESCTRL_FS && RISCV_IOMMU
> +       select ARCH_HAS_RESCTRL_DEVICES
> +       default y
> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index c8339113ef1f..148b2e28c6a3 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_RISCV_CBQRI)                       +=3D cbqr=
i.o
>  cbqri-y                                                +=3D cbqri_device=
s.o
>  cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)         +=3D cbqri_resctrl.o
>  cbqri-$(CONFIG_RISCV_CBQRI_CAPACITY)           +=3D cbqri_capacity.o
> +cbqri-$(CONFIG_RISCV_CBQRI_IOMMU)                      +=3D cbqri_iommu.=
o
> diff --git a/drivers/resctrl/cbqri_iommu.c b/drivers/resctrl/cbqri_iommu.=
c
> new file mode 100644
> index 000000000000..4086c32546bd
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_iommu.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/capability.h>
> +#include <linux/errno.h>
> +#include <linux/iommu.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
> +#include <linux/rculist.h>
> +#include <linux/rcupdate.h>
> +#include <linux/resctrl.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <asm/qos.h>
> +
> +#define IOMMU_GROUP_TOKEN      "iommu_group:"
> +
> +/*
> + * RISC-V IOMMU RCID and MCID fields are 12 bits each, so an active bind=
ing
> + * cannot contain U64_MAX.
> + */
> +#define QOS_IOMMU_BINDING_UPDATING     U64_MAX
> +
> +/* Records the resctrl QoS ID assignment for one IOMMU group. */
> +struct qos_iommu_group_binding {
> +       struct list_head node;
> +       struct rcu_head rcu;
> +       struct iommu_group *group;
> +       int group_id;
> +       /* Packed IDs, or QOS_IOMMU_BINDING_UPDATING during a hardware up=
date. */
> +       u64 state;
> +};
> +
> +/*
> + * resctrl owns IOMMU group membership bookkeeping. Do not infer members=
hip by
> + * reading RCID/MCID back from hardware: the same IDs may be shared by m=
ultiple
> + * resctrl users. Writers are serialized by rdtgroup_mutex. IOMMU attach=
 paths
> + * read the list under RCU so newly attached devices can inherit an exis=
ting
> + * group assignment without taking locks in the opposite order to resctr=
l.
> + */
> +static LIST_HEAD(qos_iommu_bindings);
> +
> +static u64 qos_iommu_group_ids_pack(struct resctrl_group_ids ids)
> +{
> +       return (u64)ids.closid << 32 | ids.rmid;
> +}
> +
> +static struct resctrl_group_ids qos_iommu_group_ids_unpack(u64 ids)
> +{
> +       return (struct resctrl_group_ids) {
> +               .closid =3D upper_32_bits(ids),
> +               .rmid =3D lower_32_bits(ids),
> +       };
> +}
> +
> +static bool qos_iommu_group_ids_match(u64 packed, struct resctrl_group_i=
ds ids)
> +{
> +       return packed !=3D QOS_IOMMU_BINDING_UPDATING &&
> +              packed =3D=3D qos_iommu_group_ids_pack(ids);
> +}
> +
> +static bool qos_iommu_group_ids_default(struct resctrl_group_ids ids)
> +{
> +       return ids.closid =3D=3D RESCTRL_RESERVED_CLOSID &&
> +              ids.rmid =3D=3D RESCTRL_RESERVED_RMID;
> +}
> +
> +static struct qos_iommu_group_binding *
> +qos_iommu_group_find_binding(int group_id)
> +{
> +       struct qos_iommu_group_binding *binding;
> +
> +       list_for_each_entry(binding, &qos_iommu_bindings, node) {
> +               if (binding->group_id =3D=3D group_id)
> +                       return binding;
> +       }
> +
> +       return NULL;
> +}
> +
> +static void qos_iommu_group_free_binding(struct qos_iommu_group_binding =
*binding)
> +{
> +       list_del_rcu(&binding->node);
> +       iommu_group_put_by_id(binding->group);
> +       kfree_rcu(binding, rcu);
> +}
> +
> +static void qos_iommu_group_prune_inactive(void)
> +{
> +       struct qos_iommu_group_binding *binding;
> +       struct qos_iommu_group_binding *tmp;
> +
> +       list_for_each_entry_safe(binding, tmp, &qos_iommu_bindings, node)=
 {
> +               if (!iommu_group_is_active(binding->group))
> +                       qos_iommu_group_free_binding(binding);
> +       }
> +}
> +
> +static int qos_iommu_group_set(struct iommu_group *group,
> +                              struct resctrl_group_ids ids)
> +{
> +       /* RISC-V IOMMU QoS maps closid->rcid and rmid->mcid 1:1. */
> +       return riscv_iommu_group_set_qosid(group, ids.closid, ids.rmid);
> +}
> +
> +int resctrl_arch_devices_write(char *tok, struct resctrl_group_ids ids)
> +{
> +       struct qos_iommu_group_binding *binding;
> +       struct qos_iommu_group_binding *new_binding =3D NULL;
> +       struct iommu_group *group;
> +       u64 old_state =3D QOS_IOMMU_BINDING_UPDATING;
> +       bool default_ids;
> +       int group_id;
> +       int ret;
> +
> +       if (strncmp(tok, IOMMU_GROUP_TOKEN, strlen(IOMMU_GROUP_TOKEN))) {
> +               resctrl_last_cmd_printf("Unsupported device token %s\n", =
tok);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       tok +=3D strlen(IOMMU_GROUP_TOKEN);
> +       if (kstrtoint(tok, 10, &group_id) || group_id < 0) {
> +               resctrl_last_cmd_printf("IOMMU group parsing error %s%s\n=
",
> +                                       IOMMU_GROUP_TOKEN, tok);
> +               return -EINVAL;
> +       }
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               resctrl_last_cmd_puts("No permission to move IOMMU group\=
n");
> +               return -EPERM;
> +       }
> +
> +       default_ids =3D qos_iommu_group_ids_default(ids);
> +       qos_iommu_group_prune_inactive();
> +       binding =3D qos_iommu_group_find_binding(group_id);
> +       if (!binding) {
> +               group =3D iommu_group_get_by_id(group_id);
> +               if (!group) {
> +                       resctrl_last_cmd_printf("No IOMMU group %d\n", gr=
oup_id);
> +                       return -ENOENT;
> +               }
> +
> +               if (default_ids) {
> +                       ret =3D qos_iommu_group_set(group, ids);
> +                       iommu_group_put_by_id(group);
> +                       if (ret)
> +                               resctrl_last_cmd_printf("Failed to reset =
IOMMU group %d QoS (%d)\n",
> +                                                       group_id, ret);
> +                       return ret;
> +               }
> +
> +               new_binding =3D kzalloc_obj(*new_binding, GFP_KERNEL);
> +               if (!new_binding) {
> +                       iommu_group_put_by_id(group);
> +                       resctrl_last_cmd_puts("Unable to allocate IOMMU g=
roup QoS binding\n");
> +                       return -ENOMEM;
> +               }
> +               binding =3D new_binding;
> +               binding->group =3D group;
> +               binding->group_id =3D group_id;
> +               binding->state =3D QOS_IOMMU_BINDING_UPDATING;
> +               list_add_tail_rcu(&binding->node, &qos_iommu_bindings);
> +       } else {
> +               group =3D binding->group;
> +               old_state =3D READ_ONCE(binding->state);
> +               WRITE_ONCE(binding->state, QOS_IOMMU_BINDING_UPDATING);
> +       }

Could this make a concurrent paging-domain attachment fail
unnecessarily?

  resctrl_arch_devices_write()
iommu_attach_group()
  --------------------------------
--------------------------------

  WRITE_ONCE(binding->state,
             QOS_IOMMU_BINDING_UPDATING);


mutex_lock(&group->mutex);

__iommu_attach_group()

__iommu_group_set_domain()

__iommu_device_set_domain()

riscv_iommu_attach_paging_domain()

 riscv_iommu_iodir_update()

   riscv_resctrl_iommu_group_get_qosid()

     return -EAGAIN

   return -EBUSY

mutex_unlock(&group->mutex);

  qos_iommu_group_set()
    riscv_iommu_group_set_qosid()
      iommu_group_update_devices()
        mutex_lock(&group->mutex);
        riscv_iommu_qosid_validate_dev()
        riscv_iommu_qosid_apply_dev()
        mutex_unlock(&group->mutex);

Since QOS_IOMMU_BINDING_UPDATING is published before
iommu_group_update_devices() acquires group->mutex, the attachment can
acquire group->mutex first, but still fail with -EBUSY after observing
the transient state.

Should the binding state transition be serialized with the group update
under group->mutex instead?

Thanks,
Yunhui

> +
> +       ret =3D qos_iommu_group_set(group, ids);
> +       if (ret) {
> +               if (new_binding)
> +                       qos_iommu_group_free_binding(binding);
> +               else
> +                       WRITE_ONCE(binding->state, old_state);
> +               resctrl_last_cmd_printf("Failed to move IOMMU group %d Qo=
S (%d)\n",
> +                                       group_id, ret);
> +               return ret;
> +       }
> +
> +       if (default_ids)
> +               qos_iommu_group_free_binding(binding);
> +       else
> +               WRITE_ONCE(binding->state, qos_iommu_group_ids_pack(ids))=
;
> +
> +       return 0;
> +}
> +
> +int riscv_resctrl_iommu_group_get_qosid(struct iommu_group *group, u32 *=
rcid,
> +                                       u32 *mcid)
> +{
> +       struct qos_iommu_group_binding *binding;
> +       int ret =3D -ENOENT;
> +
> +       if (!group)
> +               return -ENODEV;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(binding, &qos_iommu_bindings, node) {
> +               struct resctrl_group_ids ids;
> +               u64 state;
> +
> +               if (binding->group !=3D group)
> +                       continue;
> +               state =3D READ_ONCE(binding->state);
> +               if (state =3D=3D QOS_IOMMU_BINDING_UPDATING) {
> +                       ret =3D -EAGAIN;
> +                       break;
> +               }
> +
> +               ids =3D qos_iommu_group_ids_unpack(state);
> +               if (rcid)
> +                       *rcid =3D ids.closid;
> +               if (mcid)
> +                       *mcid =3D ids.rmid;
> +               ret =3D 0;
> +               break;
> +       }
> +       rcu_read_unlock();
> +
> +       return ret;
> +}
> +
> +void resctrl_arch_devices_show(struct seq_file *s, struct resctrl_group_=
ids ids)
> +{
> +       struct qos_iommu_group_binding *binding;
> +
> +       qos_iommu_group_prune_inactive();
> +       list_for_each_entry(binding, &qos_iommu_bindings, node) {
> +               if (qos_iommu_group_ids_match(READ_ONCE(binding->state), =
ids))
> +                       seq_printf(s, "iommu_group:%d\n", binding->group_=
id);
> +       }
> +}
> +
> +bool resctrl_arch_devices_assigned(struct resctrl_group_ids ids)
> +{
> +       struct qos_iommu_group_binding *binding;
> +
> +       qos_iommu_group_prune_inactive();
> +       list_for_each_entry(binding, &qos_iommu_bindings, node) {
> +               if (qos_iommu_group_ids_match(READ_ONCE(binding->state), =
ids))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +int resctrl_arch_devices_reset_all(struct resctrl_group_ids default_ids)
> +{
> +       struct qos_iommu_group_binding *binding;
> +       struct qos_iommu_group_binding *tmp;
> +       u64 old_state;
> +       int first_ret =3D 0;
> +       int ret;
> +
> +       qos_iommu_group_prune_inactive();
> +       list_for_each_entry_safe(binding, tmp, &qos_iommu_bindings, node)=
 {
> +               old_state =3D READ_ONCE(binding->state);
> +               WRITE_ONCE(binding->state, QOS_IOMMU_BINDING_UPDATING);
> +               ret =3D qos_iommu_group_set(binding->group, default_ids);
> +               if (ret) {
> +                       WRITE_ONCE(binding->state, old_state);
> +                       if (!first_ret)
> +                               first_ret =3D ret;
> +                       resctrl_last_cmd_printf("Failed to reset IOMMU gr=
oup %d QoS (%d)\n",
> +                                               binding->group_id, ret);
> +                       continue;
> +               }
> +
> +               qos_iommu_group_free_binding(binding);
> +       }
> +
> +       return first_ret;
> +}
> --
> 2.50.1 (Apple Git-155)
>
