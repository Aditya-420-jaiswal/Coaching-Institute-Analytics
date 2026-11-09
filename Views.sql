--1."CREATE OR REPLACE VIEW public.vw_course_fee_analysis AS  SELECT i.institute_id,
    i.institute_name,
    count(DISTINCT c.course_id) AS total_courses,
    round(avg(f.listed_fee), 2) AS average_course_fee,
    min(f.listed_fee) AS lowest_course_fee,
    max(f.listed_fee) AS highest_course_fee
   FROM ((institutes i
     JOIN courses c ON (((i.institute_id)::text = (c.institute_id)::text)))
     JOIN fees f ON (((c.course_id)::text = (f.course_id)::text)))
  GROUP BY i.institute_id, i.institute_name;;

--2.CREATE OR REPLACE VIEW public.vw_delivery_mode_analysis AS  SELECT delivery_mode,
    count(*) AS total_courses,
    round(avg(duration_months), 1) AS avg_duration_months,
    min(duration_months) AS shortest_duration,
    max(duration_months) AS longest_duration
   FROM courses
  GROUP BY delivery_mode;;

--3.CREATE OR REPLACE VIEW public.vw_exam_results_analysis AS  SELECT e.exam_id,
    e.exam_name,
    e.exam_category,
    count(r.result_record_id) AS result_records,
    count(DISTINCT r.institute_id) AS institutes_reporting,
    sum(r.reported_selections) AS total_reported_selections,
    round(avg(r.reported_selections), 2) AS avg_reported_selections
   FROM (exams e
     LEFT JOIN results r ON (((e.exam_id)::text = (r.exam_id)::text)))
  GROUP BY e.exam_id, e.exam_name, e.exam_category;;

--4.CREATE OR REPLACE VIEW public.vw_institute_overview AS  SELECT i.institute_id,
    i.institute_name,
    count(DISTINCT c.course_id) AS total_courses,
    count(DISTINCT b.branch_id) AS total_branches
   FROM ((institutes i
     LEFT JOIN courses c ON (((i.institute_id)::text = (c.institute_id)::text)))
     LEFT JOIN branches b ON (((i.institute_id)::text = (b.institute_id)::text)))
  GROUP BY i.institute_id, i.institute_name;;

--5.CREATE OR REPLACE VIEW public.vw_institute_performance AS  SELECT i.institute_id,
    i.institute_name,
    count(DISTINCT c.course_id) AS total_courses,
    count(DISTINCT b.branch_id) AS total_branches,
    round(avg(DISTINCT f.listed_fee), 2) AS average_course_fee,
    round(avg(DISTINCT r.rating_out_of_5), 2) AS average_rating
   FROM ((((institutes i
     LEFT JOIN courses c ON (((i.institute_id)::text = (c.institute_id)::text)))
     LEFT JOIN fees f ON (((c.course_id)::text = (f.course_id)::text)))
     LEFT JOIN branches b ON (((i.institute_id)::text = (b.institute_id)::text)))
     LEFT JOIN reviews r ON (((i.institute_id)::text = (r.institute_id)::text)))
  GROUP BY i.institute_id, i.institute_name;;

--6.CREATE OR REPLACE VIEW public.vw_review_analysis AS  SELECT i.institute_id,
    i.institute_name,
    count(r.review_id) AS review_records,
    round(avg(r.rating_out_of_5), 2) AS average_rating,
    sum(r.review_count_at_observation) AS total_observed_reviews
   FROM (institutes i
     LEFT JOIN reviews r ON (((i.institute_id)::text = (r.institute_id)::text)))
  GROUP BY i.institute_id, i.institute_name;;

--7.CREATE OR REPLACE VIEW public.vw_state_branch_analysis AS  SELECT state,
    count(*) AS total_branches,
    count(DISTINCT institute_id) AS institutes_present
   FROM branches
  GROUP BY state;;"