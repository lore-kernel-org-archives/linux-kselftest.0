From: philip.li at intel.com (Philip Li)
Date: Fri, 13 Apr 2018 23:49:01 +0800
Subject: [kbuild-all] [PATCH v2] selftests/livepatch: introduce tests
In-Reply-To: <b20ea6f4-5f8a-d99b-deaf-eb76297251a2@redhat.com>
References: <1523373354-10801-2-git-send-email-joe.lawrence@redhat.com>
 <201804111155.d856J7oR%fengguang.wu@intel.com>
 <b20ea6f4-5f8a-d99b-deaf-eb76297251a2@redhat.com>
Message-ID: <20180413154901.GD20885@intel.com>

On Wed, Apr 11, 2018 at 09:59:59AM -0400, Joe Lawrence wrote:
> On 04/10/2018 11:44 PM, kbuild test robot wrote:
> > Hi Joe,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on v4.16]
> > [also build test ERROR on next-20180410]
> > [cannot apply to linus/master jikos-livepatching/for-next]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>                                    ^^^^^^^^^^^^^^
> Hi kbuild test robot,
> 
> Thank you for testing!  Yet something to improve:
> 
> Is there syntax one can add to a commit, or better yet, patchset cover
> letter to specify a git tree URL in which the patch(set) is based on?
thanks Joe, currently we recommend to use --base option when using git format-patch.
This will record the base of your series, and 0day would act accordingly to apply
to that base.

> 
> I can't find anything at [1] that documents such feature.
> 
> [1] https://01.org/lkp/documentation/0-day-test-service
> 
> Thanks,
> 
> -- Joe
> _______________________________________________
> kbuild-all mailing list
> kbuild-all at lists.01.org
> https://lists.01.org/mailman/listinfo/kbuild-all
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
