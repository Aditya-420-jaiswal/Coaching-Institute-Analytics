"-- 1. Institute Overview
SELECT * FROM public.vw_institute_overview;

-- 2. Average Course Fee by Institute
SELECT * FROM public.vw_course_fee_analysis
         ORDER BY average_course_fee DESC;

-- 3. Review Analysis
SELECT * FROM public.vw_review_analysis
         ORDER BY average_rating DESC;

-- 4. Exam Results Analysis
SELECT * FROM public.vw_exam_results_analysis
         ORDER BY total_reported_selections DESC;

-- 5. Delivery Mode Analysis
SELECT * FROM public.vw_delivery_mode_analysis;

-- 6. State-wise Branch Analysis
SELECT * FROM public.vw_state_branch_analysis
         ORDER BY total_branches DESC;

-- 7. Institute Performance Analysis
SELECT * FROM public.vw_institute_performance;"